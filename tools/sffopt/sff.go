package main

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"image"
	"image/png"
	"os"
)

const (
	sffHeaderSize  = 512
	spriteNodeSize = 28
	palNodeSize    = 16
	fmtPNG8        = 10
	fmtPNG32       = 12
)

type palNode struct {
	group  uint16
	item   uint16
	colors uint16
	link   uint16
	data   []byte
}

type spriteNode struct {
	group  uint16
	item   uint16
	w      uint16
	h      uint16
	x      int16
	y      int16
	link   uint16
	format uint8
	depth  uint8
	pal    uint16
	flags  uint16
	data   []byte
}

type sffFile struct {
	rest    [sffHeaderSize]byte
	pals    []palNode
	sprites []spriteNode
}

func readSFFV2(path string) (*sffFile, error) {
	raw, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}
	if len(raw) < sffHeaderSize || string(raw[:11]) != "ElecbyteSpr" {
		return nil, fmt.Errorf("não é SFF")
	}
	if raw[15] != 2 {
		return nil, fmt.Errorf("SFF não é versão 2")
	}
	sf := &sffFile{}
	copy(sf.rest[:], raw[:sffHeaderSize])
	spriteOf := int(binary.LittleEndian.Uint32(raw[36:40]))
	numSprites := int(binary.LittleEndian.Uint32(raw[40:44]))
	palOf := int(binary.LittleEndian.Uint32(raw[44:48]))
	numPals := int(binary.LittleEndian.Uint32(raw[48:52]))
	ldataOf := int(binary.LittleEndian.Uint32(raw[52:56]))
	ldataLen := int(binary.LittleEndian.Uint32(raw[56:60]))
	tdataOf := int(binary.LittleEndian.Uint32(raw[60:64]))
	tdataLen := int(binary.LittleEndian.Uint32(raw[64:68]))
	if spriteOf < 0 || palOf < 0 || ldataOf < 0 || tdataOf < 0 {
		return nil, fmt.Errorf("offsets inválidos")
	}
	if numPals < 0 || numSprites < 0 || ldataOf+ldataLen > len(raw) || tdataOf+tdataLen > len(raw) {
		return nil, fmt.Errorf("bloco de dados fora do arquivo")
	}
	sf.pals = make([]palNode, numPals)
	for i := 0; i < numPals; i++ {
		p := palOf + i*palNodeSize
		if p+palNodeSize > len(raw) {
			return nil, fmt.Errorf("paleta %d fora do arquivo", i)
		}
		sf.pals[i] = palNode{
			group:  binary.LittleEndian.Uint16(raw[p:]),
			item:   binary.LittleEndian.Uint16(raw[p+2:]),
			colors: binary.LittleEndian.Uint16(raw[p+4:]),
			link:   binary.LittleEndian.Uint16(raw[p+6:]),
		}
		off := int(binary.LittleEndian.Uint32(raw[p+8:]))
		ln := int(binary.LittleEndian.Uint32(raw[p+12:]))
		if sf.pals[i].link == 0 && ln > 0 {
			if off+ln > ldataLen {
				return nil, fmt.Errorf("dados da paleta %d fora do ldata", i)
			}
			sf.pals[i].data = append([]byte(nil), raw[ldataOf+off:ldataOf+off+ln]...)
		}
	}
	sf.sprites = make([]spriteNode, numSprites)
	if spriteOf+numSprites*spriteNodeSize > len(raw) {
		return nil, fmt.Errorf("tabela de sprites fora do arquivo")
	}
	for i := 0; i < numSprites; i++ {
		p := spriteOf + i*spriteNodeSize
		s := spriteNode{
			group:  binary.LittleEndian.Uint16(raw[p:]),
			item:   binary.LittleEndian.Uint16(raw[p+2:]),
			w:      binary.LittleEndian.Uint16(raw[p+4:]),
			h:      binary.LittleEndian.Uint16(raw[p+6:]),
			x:      int16(binary.LittleEndian.Uint16(raw[p+8:])),
			y:      int16(binary.LittleEndian.Uint16(raw[p+10:])),
			link:   binary.LittleEndian.Uint16(raw[p+12:]),
			format: raw[p+14],
			depth:  raw[p+15],
			pal:    binary.LittleEndian.Uint16(raw[p+24:]),
			flags:  binary.LittleEndian.Uint16(raw[p+26:]),
		}
		off := int(binary.LittleEndian.Uint32(raw[p+16:]))
		ln := int(binary.LittleEndian.Uint32(raw[p+20:]))
		if s.link == 0 && ln > 0 {
			base := ldataOf
			limit := ldataLen
			if s.flags&1 != 0 {
				base = tdataOf
				limit = tdataLen
			}
			if off+ln > limit {
				return nil, fmt.Errorf("sprite %d fora dos dados", i)
			}
			s.data = append([]byte(nil), raw[base+off:base+off+ln]...)
		}
		sf.sprites[i] = s
	}
	return sf, nil
}

func (sf *sffFile) write(path string) error {
	palOf := 0
	spriteOf := sffHeaderSize
	if len(sf.pals) > 0 {
		palOf = sffHeaderSize
		spriteOf = sffHeaderSize + len(sf.pals)*palNodeSize
	}
	ldataOf := spriteOf + len(sf.sprites)*spriteNodeSize
	var ldata []byte
	palPos := make([]int, len(sf.pals))
	for i := range sf.pals {
		if sf.pals[i].link != 0 || len(sf.pals[i].data) == 0 {
			palPos[i] = 0
			continue
		}
		palPos[i] = len(ldata)
		ldata = append(ldata, sf.pals[i].data...)
	}
	sprPos := make([]int, len(sf.sprites))
	for i := range sf.sprites {
		if sf.sprites[i].link != 0 || len(sf.sprites[i].data) == 0 {
			continue
		}
		sprPos[i] = len(ldata)
		ldata = append(ldata, sf.sprites[i].data...)
	}
	out := make([]byte, ldataOf+len(ldata))
	copy(out, sf.rest[:])
	binary.LittleEndian.PutUint32(out[36:], uint32(spriteOf))
	binary.LittleEndian.PutUint32(out[40:], uint32(len(sf.sprites)))
	binary.LittleEndian.PutUint32(out[44:], uint32(palOf))
	binary.LittleEndian.PutUint32(out[48:], uint32(len(sf.pals)))
	binary.LittleEndian.PutUint32(out[52:], uint32(ldataOf))
	binary.LittleEndian.PutUint32(out[56:], uint32(len(ldata)))
	binary.LittleEndian.PutUint32(out[60:], 0)
	binary.LittleEndian.PutUint32(out[64:], 0)
	for i, pal := range sf.pals {
		p := palOf + i*palNodeSize
		binary.LittleEndian.PutUint16(out[p:], pal.group)
		binary.LittleEndian.PutUint16(out[p+2:], pal.item)
		binary.LittleEndian.PutUint16(out[p+4:], pal.colors)
		binary.LittleEndian.PutUint16(out[p+6:], pal.link)
		binary.LittleEndian.PutUint32(out[p+8:], uint32(palPos[i]))
		binary.LittleEndian.PutUint32(out[p+12:], uint32(len(pal.data)))
	}
	for i, s := range sf.sprites {
		p := spriteOf + i*spriteNodeSize
		binary.LittleEndian.PutUint16(out[p:], s.group)
		binary.LittleEndian.PutUint16(out[p+2:], s.item)
		binary.LittleEndian.PutUint16(out[p+4:], s.w)
		binary.LittleEndian.PutUint16(out[p+6:], s.h)
		binary.LittleEndian.PutUint16(out[p+8:], uint16(s.x))
		binary.LittleEndian.PutUint16(out[p+10:], uint16(s.y))
		binary.LittleEndian.PutUint16(out[p+12:], s.link)
		out[p+14] = s.format
		out[p+15] = s.depth
		binary.LittleEndian.PutUint32(out[p+16:], uint32(sprPos[i]))
		binary.LittleEndian.PutUint32(out[p+20:], uint32(len(s.data)))
		binary.LittleEndian.PutUint16(out[p+24:], s.pal)
		binary.LittleEndian.PutUint16(out[p+26:], 0)
	}
	copy(out[ldataOf:], ldata)
	tmp := path + ".opt.tmp"
	if err := os.WriteFile(tmp, out, 0644); err != nil {
		return err
	}
	bak := path + ".opt.bak"
	if err := os.Rename(path, bak); err != nil {
		os.Remove(tmp)
		return err
	}
	if err := os.Rename(tmp, path); err != nil {
		os.Rename(bak, path)
		return err
	}
	return os.Remove(bak)
}

func pngBytes(data []byte) ([]byte, []byte, error) {
	if len(data) >= 8 && bytes.Equal(data[:8], []byte("\x89PNG\r\n\x1a\n")) {
		return nil, data, nil
	}
	if len(data) >= 12 && bytes.Equal(data[4:12], []byte("\x89PNG\r\n\x1a\n")) {
		return append([]byte(nil), data[:4]...), data[4:], nil
	}
	return nil, nil, fmt.Errorf("dados sem PNG")
}

func packSprite(prefix []byte, pngData []byte, w, h int) []byte {
	out := make([]byte, 0, 4+len(pngData))
	if prefix != nil {
		var buf [4]byte
		binary.LittleEndian.PutUint32(buf[:], uint32(w*h))
		out = append(out, buf[:]...)
	}
	return append(out, pngData...)
}

var pngEncoder = png.Encoder{CompressionLevel: png.BestCompression}

func encodePNG(img image.Image) ([]byte, error) {
	var buf bytes.Buffer
	if err := pngEncoder.Encode(&buf, img); err != nil {
		return nil, err
	}
	return buf.Bytes(), nil
}

func recompressPNG(data []byte) ([]byte, error) {
	prefix, raw, err := pngBytes(data)
	if err != nil {
		return nil, err
	}
	img, err := png.Decode(bytes.NewReader(raw))
	if err != nil {
		return nil, err
	}
	encoded, err := encodePNG(img)
	if err != nil {
		return nil, err
	}
	if len(encoded) >= len(raw) {
		return data, nil
	}
	b := img.Bounds()
	return packSprite(prefix, encoded, b.Dx(), b.Dy()), nil
}
