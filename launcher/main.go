package main

import (
	"fmt"
	"os"
	"path/filepath"
	"runtime"
	"sync"
)

func init() {
	runtime.LockOSThread()
}

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
	uiVerify  int
	uiUpdate  int
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
		setState("Verificando...", true, false, 0, 0)
		text, canPlay := a.look()
		a.finish(text, canPlay)
	}()
}

func (a *app) finish(text string, canPlay bool) {
	switch text {
	case "Atualizado":
		setState(text, false, canPlay, 100, 100)
	case "Jogo não instalado", "Atualização disponível":
		setState(text, false, canPlay, 100, 0)
	default:
		setState(text, false, canPlay, -1, -1)
	}
}

func (a *app) look() (string, bool) {
	setState("Verificando...", true, false, 10, -1)
	if !fileExists(filepath.Join(a.game, "AnimeHeroes.exe")) {
		return "Jogo não instalado", false
	}
	setState("Verificando o Git...", true, false, 25, -1)
	if err := a.ensureGit(span{bar: barVerify, lo: 25, hi: 70}); err != nil {
		return "Jogo instalado. Não foi possível verificar a main: " + err.Error(), true
	}
	setState("Comparando com a main...", true, false, 80, -1)
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
		setState("Preparando a atualização...", true, false, -1, 0)
		if err := a.update(); err != nil {
			a.log(err.Error())
			canPlay := fileExists(filepath.Join(a.game, "AnimeHeroes.exe"))
			setUI(err.Error(), false, canPlay)
			return
		}
		setState("Atualização concluída", true, false, 0, 100)
		text, canPlay := a.look()
		a.finish(text, canPlay)
	}()
}

func (a *app) startPlay() {
	go func() {
		if err := a.play(); err != nil {
			setUI(err.Error(), false, fileExists(filepath.Join(a.game, "AnimeHeroes.exe")))
		}
	}()
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
