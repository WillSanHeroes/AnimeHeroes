package main

import (
	"encoding/binary"
	"fmt"
	"image"
	"image/color"
	"os"
)

type v1Sprite struct {
	x, y       int16
	group      uint16
	item       uint16
	link       uint16
	samePal    bool
	data       []byte
}

func readSFFV1(path string) ([]v1Sprite, error) {
	raw, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	if len(raw) < 512 || string(raw[:11]) != "ElecbyteSpr" {
		return nil, fmt.Errorf("não é SFF")
	}
	if raw[15] == 2 {
		return nil, fmt.Errorf("arquivo é SFF v2")
	}
	count := int(binary.LittleEndian.Uint32(raw[20:24]))
	off := int(binary.LittleEndian.Uint32(raw[24:28]))
	var sprites []v1Sprite
	seen := map[int]bool{}
	for off != 0 && len(sprites) < count+10 {
		if off < 0 || seen[off] {
			return nil, fmt.Errorf("subarquivo inválido em %d", off)
		}
		if off+32 > len(raw) {
			break
		}
		seen[off] = true
		next := int(binary.LittleEndian.Uint32(raw[off:]))
		ln := int(binary.LittleEndian.Uint32(raw[off+4:]))
		s := v1Sprite{
			x:       int16(binary.LittleEndian.Uint16(raw[off+8:])),
			y:       int16(binary.LittleEndian.Uint16(raw[off+10:])),
			group:   binary.LittleEndian.Uint16(raw[off+12:]),
			item:    binary.LittleEndian.Uint16(raw[off+14:]),
			link:    binary.LittleEndian.Uint16(raw[off+16:]),
			samePal: raw[off+18] != 0,
		}
		if ln > 0 {
			if off+32+ln > len(raw) {
				return nil, fmt.Errorf("PCX do sprite %d fora do arquivo", len(sprites))
			}
			s.data = append([]byte(nil), raw[off+32:off+32+ln]...)
		}
		sprites = append(sprites, s)
		off = next
	}
	if len(sprites) == 0 {
		return nil, fmt.Errorf("SFF v1 sem sprites")
	}
	return sprites, nil
}

func convertAllstar(src, dst string, progress func(int, int)) error {
	sprites, err := readSFFV1(src)
	if err != nil {
		return err
	}
	sf := &sffFile{}
	copy(sf.rest[:11], "ElecbyteSpr")
	sf.rest[13] = 1
	sf.rest[15] = 2
	sf.rest[25] = 1
	sf.rest[27] = 2
	var shared color.Palette
	sf.sprites = make([]spriteNode, len(sprites))
	for i, srcSpr := range sprites {
		s := spriteNode{
			group: srcSpr.group,
			item:  srcSpr.item,
			x:     srcSpr.x,
			y:     srcSpr.y,
		}
		if len(srcSpr.data) == 0 {
			if srcSpr.link == 0 {
				return fmt.Errorf("sprite %d sem imagem e sem link", i)
			}
			// No SFF v1 o link é o índice base 0. No v2 ele é base 1.
			s.link = srcSpr.link + 1
		} else {
			var pal color.Palette
			if srcSpr.samePal {
				pal = shared
			}
			img, nextPal, err := decodePCX(srcSpr.data, pal)
			if err != nil {
				return fmt.Errorf("sprite %d grupo %d imagem %d: %w", i, srcSpr.group, srcSpr.item, err)
			}
			if nextPal != nil {
				shared = nextPal
			}
			encoded, err := encodePNG(img)
			if err != nil {
				return err
			}
			b := img.Bounds()
			s.w = uint16(b.Dx())
			s.h = uint16(b.Dy())
			s.data = packSprite([]byte{0, 0, 0, 0}, encoded, b.Dx(), b.Dy())
			switch img.(type) {
			case *image.Paletted:
				s.format = fmtPNG8
				s.depth = 8
			default:
				s.format = fmtPNG32
				s.depth = 32
			}
		}
		sf.sprites[i] = s
		if progress != nil && (i+1)%100 == 0 {
			progress(i+1, len(sprites))
		}
	}
	for i := range sf.sprites {
		if sf.sprites[i].link == 0 {
			continue
		}
		src := int(sf.sprites[i].link) - 1
		hops := 0
		for src >= 0 && src < len(sf.sprites) && sf.sprites[src].link != 0 && hops < 8 {
			src = int(sf.sprites[src].link) - 1
			hops++
		}
		if src < 0 || src >= len(sf.sprites) || sf.sprites[src].w == 0 {
			return fmt.Errorf("link inválido no sprite %d", i)
		}
		sf.sprites[i].w = sf.sprites[src].w
		sf.sprites[i].h = sf.sprites[src].h
		sf.sprites[i].format = sf.sprites[src].format
		sf.sprites[i].depth = sf.sprites[src].depth
	}
	if progress != nil {
		progress(len(sprites), len(sprites))
	}
	return sf.write(dst)
}
