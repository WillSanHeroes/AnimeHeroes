package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

func rewriteAIR(path string, factors map[[2]int]float64) error {
	f, err := os.Open(path)
	if err != nil {
		return err
	}
	var lines []string
	sc := bufio.NewScanner(f)
	sc.Buffer(make([]byte, 64*1024), 1024*1024)
	for sc.Scan() {
		lines = append(lines, strings.TrimRight(sc.Text(), "\r"))
	}
	if err := sc.Err(); err != nil {
		f.Close()
		return err
	}
	f.Close()

	var out []string
	for i := 0; i < len(lines); {
		if !isClsnHeader(lines[i]) {
			out = append(out, lines[i])
			i++
			continue
		}
		block := []string{lines[i]}
		j := i + 1
		for j < len(lines) && isClsnBox(lines[j]) {
			block = append(block, lines[j])
			j++
		}
		k := j
		type frame struct {
			line string
			g    int
			img  int
		}
		var frames []frame
		for k < len(lines) {
			if isClsnHeader(lines[k]) || strings.HasPrefix(lines[k], "[Begin Action") {
				break
			}
			g, img, ok := parseFrame(lines[k])
			if !ok {
				break
			}
			frames = append(frames, frame{lines[k], g, img})
			k++
		}
		if len(frames) == 0 {
			out = append(out, block...)
			i = j
			continue
		}
		same := true
		first := frameFactor(factors, frames[0].g, frames[0].img)
		vals := make([]float64, len(frames))
		vals[0] = first
		for n := 1; n < len(frames); n++ {
			vals[n] = frameFactor(factors, frames[n].g, frames[n].img)
			if vals[n] != first {
				same = false
			}
		}
		if same {
			out = append(out, scaleBlock(block, first)...)
			for _, fr := range frames {
				out = append(out, fr.line)
			}
		} else {
			for n, fr := range frames {
				out = append(out, scaleBlock(demoteDefault(block), vals[n])...)
				out = append(out, fr.line)
			}
		}
		i = k
	}
	tmp := path + ".opt.tmp"
	if err := os.WriteFile(tmp, []byte(strings.Join(out, "\r\n")+"\r\n"), 0644); err != nil {
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

func frameFactor(factors map[[2]int]float64, g, img int) float64 {
	if v, ok := factors[[2]int{g, img}]; ok {
		return v
	}
	return 1
}

func isClsnHeader(line string) bool {
	s := strings.TrimSpace(line)
	return strings.HasPrefix(s, "Clsn1") || strings.HasPrefix(s, "Clsn2")
}

func isClsnBox(line string) bool {
	s := strings.TrimSpace(line)
	return strings.HasPrefix(s, "Clsn1[") || strings.HasPrefix(s, "Clsn2[")
}

func parseFrame(line string) (int, int, bool) {
	s := strings.TrimSpace(line)
	if s == "" || strings.HasPrefix(s, ";") || strings.HasPrefix(s, "[") {
		return 0, 0, false
	}
	parts := strings.Split(s, ",")
	if len(parts) < 2 {
		return 0, 0, false
	}
	g, err1 := strconv.Atoi(strings.TrimSpace(parts[0]))
	img, err2 := strconv.Atoi(strings.TrimSpace(parts[1]))
	if err1 != nil || err2 != nil {
		return 0, 0, false
	}
	return g, img, true
}

func demoteDefault(block []string) []string {
	out := append([]string(nil), block...)
	head := strings.TrimSpace(out[0])
	if strings.HasPrefix(head, "Clsn1Default") {
		out[0] = strings.Replace(out[0], "Clsn1Default", "Clsn1", 1)
	}
	if strings.HasPrefix(head, "Clsn2Default") {
		out[0] = strings.Replace(out[0], "Clsn2Default", "Clsn2", 1)
	}
	return out
}

func scaleBlock(block []string, factor float64) []string {
	if factor == 1 {
		return block
	}
	out := make([]string, len(block))
	for i, line := range block {
		out[i] = scaleClsnLine(line, factor)
	}
	return out
}

func scaleClsnLine(line string, factor float64) string {
	s := strings.TrimSpace(line)
	if !strings.HasPrefix(s, "Clsn1[") && !strings.HasPrefix(s, "Clsn2[") {
		return line
	}
	eq := strings.Index(line, "=")
	if eq < 0 {
		return line
	}
	parts := strings.Split(line[eq+1:], ",")
	if len(parts) != 4 {
		return line
	}
	var nums [4]int
	for i, p := range parts {
		n, err := strconv.Atoi(strings.TrimSpace(p))
		if err != nil {
			return line
		}
		nums[i] = int(math.Round(float64(n) * factor))
	}
	indent := line[:len(line)-len(strings.TrimLeft(line, " \t"))]
	name := strings.TrimSpace(line[:eq])
	return fmt.Sprintf("%s%s = %d, %d, %d, %d", indent, name, nums[0], nums[1], nums[2], nums[3])
}
