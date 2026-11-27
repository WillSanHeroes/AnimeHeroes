package main

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
)

func decodePCX(data []byte, shared color.Palette) (image.Image, color.Palette, error) {
	if len(data) < 128 || data[0] != 0x0A {
		return nil, nil, fmt.Errorf("não é PCX")
	}
	bpp := int(data[3])
	xmin := int(binary.LittleEndian.Uint16(data[4:6]))
	ymin := int(binary.LittleEndian.Uint16(data[6:8]))
	xmax := int(binary.LittleEndian.Uint16(data[8:10]))
	ymax := int(binary.LittleEndian.Uint16(data[10:12]))
	w := xmax - xmin + 1
	h := ymax - ymin + 1
	if w <= 0 || h <= 0 || w > 20000 || h > 20000 {
		return nil, nil, fmt.Errorf("tamanho PCX inválido %dx%d", w, h)
	}
	planes := int(data[65])
	bpl := int(binary.LittleEndian.Uint16(data[66:68]))
	if bpl <= 0 || planes <= 0 {
		return nil, nil, fmt.Errorf("PCX sem planos")
	}
	body := data[128:]
	var pal color.Palette
	var pix []byte
	if bpp == 8 && planes == 1 && len(body) > 769 && body[len(body)-769] == 12 {
		trial, _ := unrle(body[:len(body)-769], bpl*planes*h)
		if len(trial) >= bpl*planes*h {
			pix = trial
			raw := data[len(data)-768:]
			pal = make(color.Palette, 256)
			for i := 0; i < 256; i++ {
				pal[i] = color.NRGBA{R: raw[i*3], G: raw[i*3+1], B: raw[i*3+2], A: 255}
			}
		}
	}
	if pix == nil {
		var err error
		pix, err = unrle(body, bpl*planes*h)
		if err != nil || len(pix) < bpl*planes*h {
			return nil, nil, fmt.Errorf("PCX curto: %d de %d", len(pix), bpl*planes*h)
		}
		if shared != nil {
			pal = clonePalette(shared)
		}
	}
	if planes == 1 && bpp == 8 {
		if pal == nil {
			return nil, nil, fmt.Errorf("PCX sem paleta")
		}
		if c, ok := pal[0].(color.NRGBA); ok {
			c.A = 0
			pal[0] = c
		}
		img := image.NewPaletted(image.Rect(0, 0, w, h), pal)
		for y := 0; y < h; y++ {
			copy(img.Pix[y*img.Stride:y*img.Stride+w], pix[y*bpl:y*bpl+w])
		}
		return img, pal, nil
	}
	if planes == 3 && bpp == 8 {
		img := image.NewNRGBA(image.Rect(0, 0, w, h))
		for y := 0; y < h; y++ {
			base := y * bpl * 3
			for x := 0; x < w; x++ {
				i := img.PixOffset(x, y)
				img.Pix[i] = pix[base+x]
				img.Pix[i+1] = pix[base+bpl+x]
				img.Pix[i+2] = pix[base+2*bpl+x]
				img.Pix[i+3] = 255
			}
		}
		return img, nil, nil
	}
	return nil, nil, fmt.Errorf("PCX bpp=%d planos=%d não suportado", bpp, planes)
}

func unrle(data []byte, need int) ([]byte, error) {
	pix := make([]byte, 0, need)
	for i := 0; i < len(data) && len(pix) < need; {
		b := data[i]
		i++
		if b >= 0xC0 {
			count := int(b & 0x3F)
			if count == 0 || i >= len(data) {
				return pix, fmt.Errorf("PCX truncado")
			}
			v := data[i]
			i++
			for k := 0; k < count && len(pix) < need; k++ {
				pix = append(pix, v)
			}
			continue
		}
		pix = append(pix, b)
	}
	return pix, nil
}

func clonePalette(pal color.Palette) color.Palette {
	out := make(color.Palette, len(pal))
	copy(out, pal)
	return out
}
