package main

import (
	"syscall"
	"unsafe"
)

var (
	user32   = syscall.NewLazyDLL("user32.dll")
	gdi32    = syscall.NewLazyDLL("gdi32.dll")
	kernel32 = syscall.NewLazyDLL("kernel32.dll")

	procRegisterClassExW = user32.NewProc("RegisterClassExW")
	procCreateWindowExW  = user32.NewProc("CreateWindowExW")
	procDefWindowProcW   = user32.NewProc("DefWindowProcW")
	procDestroyWindow    = user32.NewProc("DestroyWindow")
	procPostQuitMessage  = user32.NewProc("PostQuitMessage")
	procPostMessageW     = user32.NewProc("PostMessageW")
	procGetMessageW      = user32.NewProc("GetMessageW")
	procTranslateMessage = user32.NewProc("TranslateMessage")
	procDispatchMessageW = user32.NewProc("DispatchMessageW")
	procShowWindow       = user32.NewProc("ShowWindow")
	procUpdateWindow     = user32.NewProc("UpdateWindow")
	procSetWindowTextW   = user32.NewProc("SetWindowTextW")
	procSendMessageW     = user32.NewProc("SendMessageW")
	procEnableWindow     = user32.NewProc("EnableWindow")
	procLoadCursorW      = user32.NewProc("LoadCursorW")
	procCreateFontW      = gdi32.NewProc("CreateFontW")
	procGetModuleHandleW = kernel32.NewProc("GetModuleHandleW")
)

const (
	wsOverlapped   = 0x00000000
	wsCaption      = 0x00C00000
	wsSysMenu      = 0x00080000
	wsMinimizeBox  = 0x00020000
	wsVisible      = 0x10000000
	wsChild        = 0x40000000
	wsTabStop      = 0x00010000
	wmDestroy      = 0x0002
	wmClose        = 0x0010
	wmCommand      = 0x0111
	wmSetFont      = 0x0030
	wmCreate       = 0x0001
	swShow         = 5
	cwUseDefault   = 0x80000000
	colorWindow    = 5
	defaultCharset = 1
)

type wndClassEx struct {
	cbSize        uint32
	style         uint32
	lpfnWndProc   uintptr
	cbClsExtra    int32
	cbWndExtra    int32
	hInstance     uintptr
	hIcon         uintptr
	hCursor       uintptr
	hbrBackground uintptr
	lpszMenuName  *uint16
	lpszClassName *uint16
	hIconSm       uintptr
}

type point struct {
	x, y int32
}

type winMsg struct {
	hwnd    uintptr
	message uint32
	_       uint32
	wParam  uintptr
	lParam  uintptr
	time    uint32
	pt      point
}

var (
	mainWnd   uintptr
	statusWnd uintptr
	updateWnd uintptr
	playWnd   uintptr
)

func runWindow() error {
	className, _ := syscall.UTF16PtrFromString("AnimeHeroesLauncher")
	title, _ := syscall.UTF16PtrFromString("Anime Heroes")
	inst, _, _ := procGetModuleHandleW.Call(0)
	cursor, _, _ := procLoadCursorW.Call(0, 32512)
	wc := wndClassEx{
		cbSize:        uint32(unsafe.Sizeof(wndClassEx{})),
		lpfnWndProc:   syscall.NewCallback(wndProc),
		hInstance:     inst,
		hCursor:       cursor,
		hbrBackground: colorWindow + 1,
		lpszClassName: className,
	}
	if r, _, err := procRegisterClassExW.Call(uintptr(unsafe.Pointer(&wc))); r == 0 {
		return err
	}
	hwnd, _, err := procCreateWindowExW.Call(
		0,
		uintptr(unsafe.Pointer(className)),
		uintptr(unsafe.Pointer(title)),
		wsOverlapped|wsCaption|wsSysMenu|wsMinimizeBox,
		uintptr(cwUseDefault), uintptr(cwUseDefault), 480, 230,
		0, 0, inst, 0,
	)
	if hwnd == 0 {
		return err
	}
	procShowWindow.Call(hwnd, swShow)
	procUpdateWindow.Call(hwnd)
	theApp.refresh()
	var msg winMsg
	for {
		r, _, _ := procGetMessageW.Call(uintptr(unsafe.Pointer(&msg)), 0, 0, 0)
		if int32(r) == 0 {
			return nil
		}
		if int32(r) == -1 {
			return syscall.EINVAL
		}
		procTranslateMessage.Call(uintptr(unsafe.Pointer(&msg)))
		procDispatchMessageW.Call(uintptr(unsafe.Pointer(&msg)))
	}
}

func wndProc(hwnd, msg, wparam, lparam uintptr) uintptr {
	switch msg {
	case wmCreate:
		createControls(hwnd)
		return 0
	case wmCommand:
		if wparam&0xffff == idUpdate {
			theApp.startUpdate()
		}
		if wparam&0xffff == idPlay {
			theApp.startPlay()
		}
		return 0
	case wmStatus:
		applyUI()
		return 0
	case wmClose:
		theApp.stopJob()
		procDestroyWindow.Call(hwnd)
		return 0
	case wmDestroy:
		procPostQuitMessage.Call(0)
		return 0
	}
	r, _, _ := procDefWindowProcW.Call(hwnd, msg, wparam, lparam)
	return r
}

func createControls(hwnd uintptr) {
	mainWnd = hwnd
	inst, _, _ := procGetModuleHandleW.Call(0)
	font := createFont()
	statusWnd = createControl(hwnd, inst, "STATIC", "Verificando...", wsChild|wsVisible, 20, 18, 424, 88, 0)
	updateWnd = createControl(hwnd, inst, "BUTTON", "Atualizar", wsChild|wsVisible|wsTabStop, 20, 124, 200, 36, idUpdate)
	playWnd = createControl(hwnd, inst, "BUTTON", "Jogar", wsChild|wsVisible|wsTabStop, 244, 124, 200, 36, idPlay)
	for _, h := range []uintptr{statusWnd, updateWnd, playWnd} {
		procSendMessageW.Call(h, wmSetFont, font, 1)
	}
	procEnableWindow.Call(updateWnd, 0)
	procEnableWindow.Call(playWnd, 0)
}

func createControl(parent, inst uintptr, class, text string, style uint32, x, y, w, h int32, id uintptr) uintptr {
	cls, _ := syscall.UTF16PtrFromString(class)
	txt, _ := syscall.UTF16PtrFromString(text)
	hwnd, _, err := procCreateWindowExW.Call(
		0,
		uintptr(unsafe.Pointer(cls)),
		uintptr(unsafe.Pointer(txt)),
		uintptr(style),
		uintptr(x), uintptr(y), uintptr(w), uintptr(h),
		parent, id, inst, 0,
	)
	if hwnd == 0 {
		panic(err)
	}
	return hwnd
}

func createFont() uintptr {
	name, _ := syscall.UTF16PtrFromString("Segoe UI")
	font, _, _ := procCreateFontW.Call(
		18, 0, 0, 0, 400,
		0, 0, 0, defaultCharset,
		0, 0, 5, 0,
		uintptr(unsafe.Pointer(name)),
	)
	return font
}

func setUI(text string, busy, canPlay bool) {
	uiMu.Lock()
	uiText = text
	uiBusy = busy
	uiCanPlay = canPlay
	uiMu.Unlock()
	if mainWnd != 0 {
		procPostMessageW.Call(mainWnd, wmStatus, 0, 0)
	}
}

func applyUI() {
	uiMu.Lock()
	text, busy, canPlay := uiText, uiBusy, uiCanPlay
	uiMu.Unlock()
	txt, _ := syscall.UTF16PtrFromString(text)
	procSetWindowTextW.Call(statusWnd, uintptr(unsafe.Pointer(txt)))
	enable(updateWnd, !busy)
	enable(playWnd, !busy && canPlay)
}

func enable(hwnd uintptr, on bool) {
	flag := uintptr(0)
	if on {
		flag = 1
	}
	procEnableWindow.Call(hwnd, flag)
}
