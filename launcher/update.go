package main

import (
	"bufio"
	"bytes"
	"crypto/sha256"
	"encoding/hex"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
)

const (
	repoURL    = "https://github.com/WillSanHeroes/AnimeHeroes.git"
	minGitURL  = "https://github.com/git-for-windows/git/releases/download/v2.56.1.windows.1/MinGit-2.56.1-64-bit.zip"
	minGitHash = "4a92850b6e917da4fd010669b614b55dccf5b0ec333a534cc4be4700dfefdafd"
	lfsURL     = "https://github.com/git-lfs/git-lfs/releases/download/v3.7.1/git-lfs-windows-amd64-v3.7.1.zip"
)

type app struct {
	root string
	game string

	jobMu sync.Mutex
	job   *exec.Cmd
}

func newApp(root string) *app {
	return &app{root: root, game: filepath.Join(root, "game")}
}

func (a *app) gitExe() string {
	return filepath.Join(a.root, "runtime", "git", "cmd", "git.exe")
}

func (a *app) log(msg string) {
	dir := filepath.Join(a.root, "runtime")
	_ = os.MkdirAll(dir, 0755)
	f, err := os.OpenFile(filepath.Join(dir, "launcher.log"), os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0644)
	if err != nil {
		return
	}
	defer f.Close()
	fmt.Fprintln(f, msg)
}

func (a *app) ensureGit(status func(string)) error {
	if fileExists(a.gitExe()) {
		return nil
	}
	status("Baixando o Git...")
	setUI("Baixando o Git...", true, false)
	zipPath := filepath.Join(a.root, "runtime", "MinGit.zip")
	if err := download(minGitURL, zipPath, minGitHash); err != nil {
		return fmtErr("falha ao baixar o Git", err)
	}
	dest := filepath.Join(a.root, "runtime", "git")
	if err := extractZip(zipPath, dest); err != nil {
		return fmtErr("falha ao extrair o Git", err)
	}
	_ = os.Remove(zipPath)
	if !fileExists(a.gitExe()) {
		return fmt.Errorf("o Git portátil não trouxe cmd\\git.exe")
	}
	return nil
}

func (a *app) ensureLFS() error {
	lfs := filepath.Join(a.root, "runtime", "git", "cmd", "git-lfs.exe")
	if fileExists(lfs) {
		return nil
	}
	setUI("Baixando o Git LFS...", true, false)
	zipPath := filepath.Join(a.root, "runtime", "git-lfs.zip")
	if err := download(lfsURL, zipPath, ""); err != nil {
		return fmtErr("falha ao baixar o Git LFS", err)
	}
	dest := filepath.Join(a.root, "runtime", "lfs")
	if err := extractZip(zipPath, dest); err != nil {
		return err
	}
	_ = os.Remove(zipPath)
	found, err := findFile(dest, "git-lfs.exe")
	if err != nil {
		return err
	}
	return copyFile(found, lfs)
}

func (a *app) command(args ...string) *exec.Cmd {
	cmd := exec.Command(a.gitExe(), args...)
	cmd.Dir = a.game
	cmd.Env = a.gitEnv()
	return cmd
}

func (a *app) gitEnv() []string {
	cmdDir := filepath.Join(a.root, "runtime", "git", "cmd")
	var env []string
	for _, e := range os.Environ() {
		if strings.HasPrefix(strings.ToUpper(e), "GIT_CONFIG_GLOBAL=") ||
			strings.HasPrefix(strings.ToUpper(e), "GIT_CONFIG_SYSTEM=") ||
			strings.HasPrefix(strings.ToUpper(e), "GIT_DIR=") ||
			strings.HasPrefix(strings.ToUpper(e), "GIT_WORK_TREE=") ||
			strings.HasPrefix(strings.ToUpper(e), "PATH=") {
			continue
		}
		env = append(env, e)
	}
	env = append(env,
		"PATH="+cmdDir+";"+os.Getenv("PATH"),
		"GIT_CONFIG_GLOBAL="+filepath.Join(a.root, "runtime", "gitconfig"),
		"GIT_CONFIG_NOSYSTEM=1",
		"GIT_TERMINAL_PROMPT=0",
	)
	return env
}

func (a *app) run(status func(string), args ...string) error {
	cmd := a.command(args...)
	var buf bytes.Buffer
	cmd.Stdout = &buf
	cmd.Stderr = &buf
	a.track(cmd)
	err := cmd.Run()
	a.track(nil)
	if err != nil {
		msg := strings.TrimSpace(buf.String())
		if msg == "" {
			msg = err.Error()
		}
		return fmt.Errorf("%s", lastLine(msg))
	}
	return nil
}

func (a *app) runProgress(label string, args ...string) error {
	cmd := a.command(args...)
	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return err
	}
	cmd.Stderr = cmd.Stdout
	a.track(cmd)
	if err := cmd.Start(); err != nil {
		a.track(nil)
		return err
	}
	sc := bufio.NewScanner(stdout)
	sc.Buffer(make([]byte, 64*1024), 1024*1024)
	sc.Split(splitProgress)
	var last string
	for sc.Scan() {
		line := strings.TrimSpace(sc.Text())
		if line == "" {
			continue
		}
		last = line
		if len(line) > 90 {
			line = line[:90]
		}
		setUI(label+"\n"+line, true, false)
	}
	err = cmd.Wait()
	a.track(nil)
	if err != nil {
		if last == "" {
			last = err.Error()
		}
		return fmt.Errorf("%s", lastLine(last))
	}
	return nil
}

func (a *app) track(cmd *exec.Cmd) {
	a.jobMu.Lock()
	a.job = cmd
	a.jobMu.Unlock()
}

func (a *app) stopJob() {
	a.jobMu.Lock()
	cmd := a.job
	a.jobMu.Unlock()
	if cmd != nil && cmd.Process != nil {
		_ = cmd.Process.Kill()
	}
}

func (a *app) revs() (local, remote string, err error) {
	localOut, err := a.command("rev-parse", "HEAD").Output()
	if err != nil {
		return "", "", err
	}
	remoteCmd := a.command("ls-remote", "origin", "refs/heads/main")
	remoteCmd.Dir = a.game
	remoteOut, err := remoteCmd.Output()
	if err != nil {
		return "", "", err
	}
	local = strings.TrimSpace(string(localOut))
	fields := strings.Fields(string(remoteOut))
	if len(fields) == 0 {
		return "", "", fmt.Errorf("a branch main não foi encontrada")
	}
	return local, fields[0], nil
}

func (a *app) update() error {
	if gameRunning() {
		return fmt.Errorf("Feche o jogo antes de atualizar.")
	}
	if err := a.ensureGit(func(string) {}); err != nil {
		return err
	}
	installed := fileExists(filepath.Join(a.game, ".git")) || dirExists(filepath.Join(a.game, ".git"))
	if !installed {
		if dirExists(a.game) {
			empty, err := isEmptyDir(a.game)
			if err != nil {
				return err
			}
			if !empty {
				return fmt.Errorf("A pasta game já existe e não é uma instalação do jogo.")
			}
			_ = os.Remove(a.game)
		}
		setUI("Baixando o jogo...", true, false)
		if err := os.MkdirAll(filepath.Dir(a.game), 0755); err != nil {
			return err
		}
		cmd := exec.Command(a.gitExe(), "clone", "--branch", "main", "--single-branch", "--progress", repoURL, a.game)
		cmd.Env = a.gitEnv()
		cmd.Dir = a.root
		if err := a.runCmdProgress("Baixando o jogo...", cmd); err != nil {
			return fmtErr("falha ao baixar o jogo", err)
		}
	} else {
		backup := filepath.Join(a.root, "runtime", "save-backup")
		_ = os.RemoveAll(backup)
		saveDir := filepath.Join(a.game, "save")
		if dirExists(saveDir) {
			setUI("Guardando o progresso...", true, false)
			if err := copyTree(saveDir, backup); err != nil {
				return fmtErr("falha ao guardar o progresso", err)
			}
		}
		setUI("Baixando atualização...", true, false)
		if err := a.runProgress("Baixando atualização...", "fetch", "origin", "main"); err != nil {
			a.restoreSave(backup)
			return fmtErr("falha ao buscar a main", err)
		}
		if err := a.run(nil, "reset", "--hard", "origin/main"); err != nil {
			a.restoreSave(backup)
			return fmtErr("falha ao aplicar a main", err)
		}
		if dirExists(backup) {
			setUI("Restaurando o progresso...", true, false)
			if err := a.restoreSave(backup); err != nil {
				return err
			}
		}
	}
	if err := a.command("config", "core.longpaths", "true").Run(); err != nil {
		a.log("core.longpaths: " + err.Error())
	}
	if a.needsLFS() {
		if err := a.ensureLFS(); err != nil {
			return err
		}
		setUI("Baixando arquivos grandes...", true, false)
		if err := a.run(nil, "lfs", "install", "--local"); err != nil {
			return fmtErr("falha ao preparar o Git LFS", err)
		}
		if err := a.runProgress("Baixando arquivos grandes...", "lfs", "pull"); err != nil {
			return fmtErr("falha ao baixar arquivos grandes", err)
		}
	}
	return nil
}

func (a *app) restoreSave(backup string) error {
	if !dirExists(backup) {
		return nil
	}
	dest := filepath.Join(a.game, "save")
	_ = os.RemoveAll(dest)
	if err := copyTree(backup, dest); err != nil {
		return fmtErr("falha ao restaurar o progresso", err)
	}
	return nil
}

func (a *app) needsLFS() bool {
	raw, err := os.ReadFile(filepath.Join(a.game, ".gitattributes"))
	return err == nil && strings.Contains(string(raw), "filter=lfs")
}

func (a *app) play() error {
	exe := filepath.Join(a.game, "AnimeHeroes.exe")
	if !fileExists(exe) {
		return fmt.Errorf("O jogo ainda não está instalado.")
	}
	cmd := exec.Command(exe)
	cmd.Dir = a.game
	if err := cmd.Start(); err != nil {
		return fmt.Errorf("Não foi possível abrir o jogo.")
	}
	return nil
}

func (a *app) runCmdProgress(label string, cmd *exec.Cmd) error {
	stdout, err := cmd.StdoutPipe()
	if err != nil {
		return err
	}
	cmd.Stderr = cmd.Stdout
	a.track(cmd)
	if err := cmd.Start(); err != nil {
		a.track(nil)
		return err
	}
	sc := bufio.NewScanner(stdout)
	sc.Buffer(make([]byte, 64*1024), 1024*1024)
	sc.Split(splitProgress)
	var last string
	for sc.Scan() {
		line := strings.TrimSpace(sc.Text())
		if line == "" {
			continue
		}
		last = line
		if len(line) > 90 {
			line = line[:90]
		}
		setUI(label+"\n"+line, true, false)
	}
	err = cmd.Wait()
	a.track(nil)
	if err != nil {
		if last == "" {
			last = err.Error()
		}
		return fmt.Errorf("%s", lastLine(last))
	}
	return nil
}

func gameRunning() bool {
	out, err := exec.Command("tasklist", "/FI", "IMAGENAME eq AnimeHeroes.exe", "/NH").Output()
	if err != nil {
		return false
	}
	return strings.Contains(strings.ToLower(string(out)), "animeheroes.exe")
}

func download(url, dest, wantHash string) error {
	if err := os.MkdirAll(filepath.Dir(dest), 0755); err != nil {
		return err
	}
	resp, err := http.Get(url)
	if err != nil {
		return err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return fmt.Errorf("resposta %s", resp.Status)
	}
	f, err := os.Create(dest)
	if err != nil {
		return err
	}
	defer f.Close()
	sum := sha256.New()
	if _, err := io.Copy(f, io.TeeReader(resp.Body, sum)); err != nil {
		return err
	}
	if wantHash != "" && !strings.EqualFold(hex.EncodeToString(sum.Sum(nil)), wantHash) {
		return fmt.Errorf("arquivo baixado não confere")
	}
	return nil
}

func dirExists(path string) bool {
	info, err := os.Stat(path)
	return err == nil && info.IsDir()
}

func isEmptyDir(path string) (bool, error) {
	f, err := os.Open(path)
	if err != nil {
		return false, err
	}
	defer f.Close()
	_, err = f.Readdirnames(1)
	if err == io.EOF {
		return true, nil
	}
	return false, err
}

func copyTree(src, dst string) error {
	return filepath.Walk(src, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		rel, err := filepath.Rel(src, path)
		if err != nil {
			return err
		}
		target := filepath.Join(dst, rel)
		if info.IsDir() {
			return os.MkdirAll(target, 0755)
		}
		return copyFile(path, target)
	})
}

func copyFile(src, dst string) error {
	if err := os.MkdirAll(filepath.Dir(dst), 0755); err != nil {
		return err
	}
	in, err := os.Open(src)
	if err != nil {
		return err
	}
	defer in.Close()
	out, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer out.Close()
	_, err = io.Copy(out, in)
	return err
}

func findFile(root, name string) (string, error) {
	var found string
	err := filepath.Walk(root, func(path string, info os.FileInfo, err error) error {
		if err != nil || info.IsDir() {
			return err
		}
		if strings.EqualFold(info.Name(), name) {
			found = path
			return io.EOF
		}
		return nil
	})
	if found != "" {
		return found, nil
	}
	if err != nil && err != io.EOF {
		return "", err
	}
	return "", fmt.Errorf("%s não encontrado", name)
}

func lastLine(msg string) string {
	msg = strings.ReplaceAll(msg, "\r", "\n")
	parts := strings.Split(msg, "\n")
	for i := len(parts) - 1; i >= 0; i-- {
		line := strings.TrimSpace(parts[i])
		if line != "" {
			return line
		}
	}
	return msg
}

func splitProgress(data []byte, atEOF bool) (int, []byte, error) {
	if atEOF && len(data) == 0 {
		return 0, nil, nil
	}
	if i := bytes.IndexAny(data, "\r\n"); i >= 0 {
		return i + 1, data[:i], nil
	}
	if atEOF {
		return len(data), data, nil
	}
	return 0, nil, nil
}
