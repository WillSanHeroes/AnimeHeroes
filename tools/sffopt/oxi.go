package main

import (
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strconv"
)

func runOxi(path, oxipng string) error {
	sf, err := readSFFV2(path)
	if err != nil {
		return err
	}
	dir, err := os.MkdirTemp("", "sff-oxi")
	if err != nil {
		return err
	}
	defer os.RemoveAll(dir)
	type job struct {
		index  int
		prefix []byte
		before int
	}
	var jobs []job
	var files []string
	for i := range sf.sprites {
		s := &sf.sprites[i]
		if s.link != 0 || len(s.data) == 0 {
			continue
		}
		prefix, raw, err := pngBytes(s.data)
		if err != nil {
			continue
		}
		name := filepath.Join(dir, strconv.Itoa(i)+".png")
		if err := os.WriteFile(name, raw, 0644); err != nil {
			return err
		}
		jobs = append(jobs, job{i, prefix, len(raw)})
		files = append(files, name)
	}
	args := append([]string{"-o", "2", "--strip", "safe"}, files...)
	cmd := exec.Command(oxipng, args...)
	out, err := cmd.CombinedOutput()
	if err != nil {
		return fmt.Errorf("oxipng: %w\n%s", err, out)
	}
	for _, job := range jobs {
		next, err := os.ReadFile(filepath.Join(dir, strconv.Itoa(job.index)+".png"))
		if err != nil {
			return err
		}
		if len(next) >= job.before {
			continue
		}
		s := &sf.sprites[job.index]
		s.data = packSprite(job.prefix, next, int(s.w), int(s.h))
	}
	fmt.Fprintf(os.Stderr, "oxipng otimizou %d imagens\n", len(jobs))
	return sf.write(path)
}
