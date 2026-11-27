package main

import (
	"archive/zip"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"strings"
)

func extractZip(src, dest string) error {
	r, err := zip.OpenReader(src)
	if err != nil {
		return err
	}
	defer r.Close()
	if err := os.MkdirAll(dest, 0755); err != nil {
		return err
	}
	root := filepath.Clean(dest) + string(os.PathSeparator)
	for _, f := range r.File {
		name := filepath.Clean(f.Name)
		if name == "." || strings.HasPrefix(name, "..") {
			return fmt.Errorf("caminho inválido no zip")
		}
		target := filepath.Join(dest, name)
		if !strings.HasPrefix(target, root) && target != filepath.Clean(dest) {
			return fmt.Errorf("caminho inválido no zip")
		}
		if f.FileInfo().IsDir() {
			if err := os.MkdirAll(target, 0755); err != nil {
				return err
			}
			continue
		}
		if err := os.MkdirAll(filepath.Dir(target), 0755); err != nil {
			return err
		}
		in, err := f.Open()
		if err != nil {
			return err
		}
		out, err := os.OpenFile(target, os.O_CREATE|os.O_TRUNC|os.O_WRONLY, f.Mode())
		if err != nil {
			in.Close()
			return err
		}
		_, copyErr := io.Copy(out, in)
		in.Close()
		closeErr := out.Close()
		if copyErr != nil {
			return copyErr
		}
		if closeErr != nil {
			return closeErr
		}
	}
	return nil
}
