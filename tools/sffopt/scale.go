package main

import (
	"bytes"
	"fmt"
	"image"
	"image/color"
	"image/png"
	"math"

	"golang.org/x/image/draw"
)

func scaleOf(w, h int) float64 {
	m := w
	if h > m {
		m = h
	}
	switch {
	case m >= 1000:
		return 0.5
	case m >= 500:
		return 0.65
	default:
		return 1
	}
}

func scaleImage(img image.Image, factor float64) (image.Image, error) {
	b := img.Bounds()
	nw := int(math.Round(float64(b.Dx()) * factor))
	nh := int(math.Round(float64(b.Dy()) * factor))
	if nw < 1 {
		nw = 1
	}
	if nh < 1 {
		nh = 1
	}
	tmp := image.NewNRGBA(image.Rect(0, 0, nw, nh))
	draw.ApproxBiLinear.Scale(tmp, tmp.Bounds(), img, b, draw.Src, nil)
	srcPal, ok := img.(*image.Paletted)
	if !ok {
		return tmp, nil
	}
	dst := image.NewPaletted(tmp.Bounds(), clonePalette(srcPal.Palette))
	cache := map[uint16]uint8{}
	for y := 0; y < nh; y++ {
		for x := 0; x < nw; x++ {
			c := tmp.NRGBAAt(x, y)
			key := uint16(c.R>>3)<<10 | uint16(c.G>>3)<<5 | uint16(c.B>>3)
			idx, found := cache[key]
			if !found {
				idx = nearest(dst.Palette, c)
				cache[key] = idx
			}
			dst.SetColorIndex(x, y, idx)
		}
	}
	return dst, nil
}

func nearest(pal color.Palette, c color.NRGBA) uint8 {
	best := 0
	bestD := int64(1 << 62)
	cr, cg, cb, ca := int64(c.R), int64(c.G), int64(c.B), int64(c.A)
	for i, p := range pal {
		r, g, b, a := p.RGBA()
		dr := cr - int64(uint8(r>>8))
		dg := cg - int64(uint8(g>>8))
		db := cb - int64(uint8(b>>8))
		da := ca - int64(uint8(a>>8))
		d := dr*dr + dg*dg + db*db + da*da
		if d < bestD {
			bestD = d
			best = i
		}
	}
	return uint8(best)
}

func scaleSprite(sf *sffFile, index int, factor float64) error {
	s := &sf.sprites[index]
	img, err := decodeSprite(sf, s)
	if err != nil {
		return err
	}
	scaled, err := scaleImage(img, factor)
	if err != nil {
		return err
	}
	encoded, err := encodePNG(scaled)
	if err != nil {
		return err
	}
	b := scaled.Bounds()
	s.w = uint16(b.Dx())
	s.h = uint16(b.Dy())
	s.x = int16(math.Round(float64(s.x) * factor))
	s.y = int16(math.Round(float64(s.y) * factor))
	s.data = packSprite([]byte{0, 0, 0, 0}, encoded, b.Dx(), b.Dy())
	switch scaled.(type) {
	case *image.Paletted:
		s.format = fmtPNG8
		s.depth = 8
	default:
		s.format = fmtPNG32
		s.depth = 32
	}
	return nil
}

func decodeSprite(sf *sffFile, s *spriteNode) (image.Image, error) {
	switch s.format {
	case fmtPNG8, fmtPNG32:
		_, raw, err := pngBytes(s.data)
		if err != nil {
			return nil, err
		}
		return png.Decode(bytes.NewReader(raw))
	case 2, 4:
		if len(s.data) < 4 {
			return nil, fmt.Errorf("dados curtos")
		}
		payload := s.data[4:]
		var pix []byte
		var err error
		if s.format == 2 {
			pix, err = rle8Decode(payload, int(s.w), int(s.h))
		} else {
			pix, err = lz5Decode(payload, int(s.w), int(s.h))
		}
		if err != nil {
			return nil, err
		}
		pal, err := paletteOf(sf.pals, int(s.pal))
		if err != nil {
			return nil, err
		}
		img := image.NewPaletted(image.Rect(0, 0, int(s.w), int(s.h)), pal)
		for y := 0; y < int(s.h); y++ {
			copy(img.Pix[y*img.Stride:y*img.Stride+int(s.w)], pix[y*int(s.w):y*int(s.w)+int(s.w)])
		}
		return img, nil
	default:
		return nil, fmt.Errorf("formato %d não suportado", s.format)
	}
}

func paletteOf(pals []palNode, idx int) (color.Palette, error) {
	seen := 0
	for idx >= 0 && idx < len(pals) && len(pals[idx].data) == 0 && seen < 8 {
		if pals[idx].link == 0 && idx != 0 {
			break
		}
		next := int(pals[idx].link)
		if next == idx {
			break
		}
		idx = next
		seen++
	}
	if idx < 0 || idx >= len(pals) {
		return nil, fmt.Errorf("paleta %d inválida", idx)
	}
	pal := make(color.Palette, 256)
	for i := range pal {
		pal[i] = color.NRGBA{A: 255}
	}
	raw := pals[idx].data
	for i := 0; i+3 < len(raw) && i/4 < 256; i += 4 {
		pal[i/4] = color.NRGBA{R: raw[i], G: raw[i+1], B: raw[i+2], A: raw[i+3]}
	}
	return pal, nil
}

func rle8Decode(rle []byte, w, h int) ([]byte, error) {
	p := make([]byte, w*h)
	i, j := 0, 0
	for j < len(p) {
		if i >= len(rle) {
			return nil, fmt.Errorf("rle8 curto")
		}
		n, d := 1, rle[i]
		i++
		if d&0xc0 == 0x40 {
			n = int(d & 0x3f)
			if i >= len(rle) {
				return nil, fmt.Errorf("rle8 curto")
			}
			d = rle[i]
			i++
		}
		for ; n > 0 && j < len(p); n-- {
			p[j] = d
			j++
		}
	}
	return p, nil
}

func lz5Decode(rle []byte, w, h int) ([]byte, error) {
	if len(rle) == 0 {
		return nil, fmt.Errorf("lz5 vazio")
	}
	p := make([]byte, w*h)
	i, j, n := 0, 0, 0
	ct := rle[i]
	i++
	cts := uint(0)
	var rb byte
	var rbc uint
	for j < len(p) {
		if i >= len(rle) {
			return nil, fmt.Errorf("lz5 curto")
		}
		d := int(rle[i])
		i++
		if ct&byte(1<<cts) != 0 {
			if d&0x3f == 0 {
				if i+1 >= len(rle) {
					return nil, fmt.Errorf("lz5 curto")
				}
				d = (d << 2) | int(rle[i]) + 1
				i++
				n = int(rle[i]) + 2
				i++
			} else {
				rb |= byte((d & 0xc0) >> rbc)
				rbc += 2
				n = int(d & 0x3f)
				if rbc < 8 {
					if i >= len(rle) {
						return nil, fmt.Errorf("lz5 curto")
					}
					d = int(rle[i]) + 1
					i++
				} else {
					d = int(rb) + 1
					rb, rbc = 0, 0
				}
			}
			for {
				if j < len(p) {
					if d <= 0 || j-d < 0 {
						return nil, fmt.Errorf("lz5 referência inválida")
					}
					p[j] = p[j-d]
					j++
				}
				n--
				if n < 0 {
					break
				}
			}
		} else {
			if d&0xe0 == 0 {
				if i >= len(rle) {
					return nil, fmt.Errorf("lz5 curto")
				}
				n = int(rle[i]) + 8
				i++
			} else {
				n = d >> 5
				d &= 0x1f
			}
			for ; n > 0 && j < len(p); n-- {
				p[j] = byte(d)
				j++
			}
		}
		cts++
		if cts >= 8 {
			if i >= len(rle) {
				break
			}
			ct = rle[i]
			i++
			cts = 0
		}
	}
	return p, nil
}

func scaleICHIGO(sf *sffFile, progress func(int, int)) (map[[2]int]float64, error) {
	ownerFactor := make([]float64, len(sf.sprites))
	for i := range sf.sprites {
		s := &sf.sprites[i]
		if s.link != 0 {
			continue
		}
		ownerFactor[i] = scaleOf(int(s.w), int(s.h))
	}
	factors := make(map[[2]int]float64, len(sf.sprites))
	done := 0
	for i := range sf.sprites {
		s := &sf.sprites[i]
		factor := 1.0
		if s.link == 0 {
			factor = ownerFactor[i]
			if factor != 1 {
				if err := scaleSprite(sf, i, factor); err != nil {
					return nil, fmt.Errorf("sprite %d,%d: %w", s.group, s.item, err)
				}
			}
		} else {
			src := int(s.link) - 1
			if src < 0 || src >= len(ownerFactor) {
				return nil, fmt.Errorf("link inválido no sprite %d", i)
			}
			factor = ownerFactor[src]
			if factor != 1 {
				s.w = uint16(math.Round(float64(s.w) * factor))
				s.h = uint16(math.Round(float64(s.h) * factor))
				if s.w < 1 {
					s.w = 1
				}
				if s.h < 1 {
					s.h = 1
				}
				s.x = int16(math.Round(float64(s.x) * factor))
				s.y = int16(math.Round(float64(s.y) * factor))
			}
		}
		factors[[2]int{int(s.group), int(s.item)}] = factor
		done++
		if progress != nil && done%200 == 0 {
			progress(done, len(sf.sprites))
		}
	}
	if progress != nil {
		progress(len(sf.sprites), len(sf.sprites))
	}
	return factors, nil
}

func recompressSprites(sf *sffFile, progress func(int, int)) error {
	for i := range sf.sprites {
		s := &sf.sprites[i]
		if s.link != 0 || len(s.data) == 0 {
			continue
		}
		if s.format != fmtPNG8 && s.format != fmtPNG32 {
			continue
		}
		next, err := recompressPNG(s.data)
		if err != nil {
			return fmt.Errorf("sprite %d,%d: %w", s.group, s.item, err)
		}
		s.data = next
		if progress != nil && (i+1)%20 == 0 {
			progress(i+1, len(sf.sprites))
		}
	}
	if progress != nil {
		progress(len(sf.sprites), len(sf.sprites))
	}
	return nil
}
