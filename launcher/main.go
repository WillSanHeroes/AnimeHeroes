package main

import (
	"fmt"
	"os"
	"path/filepath"
	"sync"
)

const (
	idUpdate = 1
	idPlay   = 2
	wmStatus = 0x8000 + 1
)

var (
	uiMu      sync.Mutex
	uiText    string
	uiBusy    bool
	uiCanPlay bool
	theApp    *app
)

func main() {
	root, err := exeDir()
	if err != nil {
		return
	}
	theApp = newApp(root)
	if err := runWindow(); err != nil {
		theApp.log(err.Error())
	}
}

func exeDir() (string, error) {
	exe, err := os.Executable()
	if err != nil {
		return "", err
	}
	exe, err = filepath.EvalSymlinks(exe)
	if err != nil {
		return "", err
	}
	return filepath.Dir(exe), nil
}

func (a *app) refresh() {
	go func() {
		setUI("Verificando...", true, false)
		text, canPlay := a.look()
		setUI(text, false, canPlay)
	}()
}

func (a *app) look() (string, bool) {
	if !fileExists(filepath.Join(a.game, "AnimeHeroes.exe")) {
		return "Jogo não instalado", false
	}
	if err := a.ensureGit(func(string) {}); err != nil {
		return "Jogo instalado. Não foi possível verificar a main: " + err.Error(), true
	}
	local, remote, err := a.revs()
	if err != nil {
		return "Jogo instalado. Não foi possível verificar a main: " + err.Error(), true
	}
	if local == remote {
		return "Atualizado", true
	}
	return "Atualização disponível", true
}

func (a *app) startUpdate() {
	go func() {
		setUI("Preparando a atualização...", true, false)
		if err := a.update(); err != nil {
			a.log(err.Error())
			canPlay := fileExists(filepath.Join(a.game, "AnimeHeroes.exe"))
			setUI(err.Error(), false, canPlay)
			return
		}
		text, canPlay := a.look()
		setUI(text, false, canPlay)
	}()
}

func (a *app) startPlay() {
	if err := a.play(); err != nil {
		setUI(err.Error(), false, fileExists(filepath.Join(a.game, "AnimeHeroes.exe")))
	}
}

func fileExists(path string) bool {
	info, err := os.Stat(path)
	return err == nil && !info.IsDir()
}

func fmtErr(prefix string, err error) error {
	if err == nil {
		return nil
	}
	return fmt.Errorf("%s: %w", prefix, err)
}
