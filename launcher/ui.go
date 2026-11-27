package main

import (
	"bytes"
	_ "embed"
	"image"
	"image/color"
	_ "image/jpeg"
	_ "image/png"
	"syscall"
	"unsafe"
)

//go:embed logo.png
var logoData []byte

var (
	user32   = syscall.NewLazyDLL("user32.dll")
	gdi32    = syscall.NewLazyDLL("gdi32.dll")
	kernel32 = syscall.NewLazyDLL("kernel32.dll")

	procRegisterClassExW       = user32.NewProc("RegisterClassExW")
	procCreateWindowExW        = user32.NewProc("CreateWindowExW")
	procDefWindowProcW         = user32.NewProc("DefWindowProcW")
	procDestroyWindow          = user32.NewProc("DestroyWindow")
	procPostQuitMessage        = user32.NewProc("PostQuitMessage")
	procPostMessageW           = user32.NewProc("PostMessageW")
	procGetMessageW            = user32.NewProc("GetMessageW")
	procTranslateMessage       = user32.NewProc("TranslateMessage")
	procDispatchMessageW       = user32.NewProc("DispatchMessageW")
	procShowWindow             = user32.NewProc("ShowWindow")
	procUpdateWindow           = user32.NewProc("UpdateWindow")
	procLoadCursorW            = user32.NewProc("LoadCursorW")
	procLoadImageW             = user32.NewProc("LoadImageW")
	procGetSystemMetrics       = user32.NewProc("GetSystemMetrics")
	procBeginPaint             = user32.NewProc("BeginPaint")
	procEndPaint               = user32.NewProc("EndPaint")
	procInvalidateRect         = user32.NewProc("InvalidateRect")
	procGetClientRect          = user32.NewProc("GetClientRect")
	procAdjustWindowRectEx     = user32.NewProc("AdjustWindowRectEx")
	procFillRect               = user32.NewProc("FillRect")
	procDrawTextW              = user32.NewProc("DrawTextW")
	procCreateFontW            = gdi32.NewProc("CreateFontW")
	procRoundRect              = gdi32.NewProc("RoundRect")
	procSetBkMode              = gdi32.NewProc("SetBkMode")
	procSetTextColor           = gdi32.NewProc("SetTextColor")
	procCreateSolidBrush       = gdi32.NewProc("CreateSolidBrush")
	procCreatePen              = gdi32.NewProc("CreatePen")
	procSelectObject           = gdi32.NewProc("SelectObject")
	procDeleteObject           = gdi32.NewProc("DeleteObject")
	procCreateCompatibleDC     = gdi32.NewProc("CreateCompatibleDC")
	procCreateCompatibleBitmap = gdi32.NewProc("CreateCompatibleBitmap")
	procBitBlt                 = gdi32.NewProc("BitBlt")
	procDeleteDC               = gdi32.NewProc("DeleteDC")
	procSetDIBitsToDevice      = gdi32.NewProc("SetDIBitsToDevice")
	procGetModuleHandleW       = kernel32.NewProc("GetModuleHandleW")
)

const (
	wsOverlapped  = 0x00000000
	wsCaption     = 0x00C00000
	wsSysMenu     = 0x00080000
	wsMinimizeBox = 0x00020000
	wmDestroy     = 0x0002
	wmClose       = 0x0010
	wmPaint       = 0x000F
	wmEraseBkgnd  = 0x0014
	wmMouseMove   = 0x0200
	wmLButtonDown = 0x0201
	wmLButtonUp   = 0x0202
	swShow        = 5
	cwUseDefault  = 0x80000000
	srcCopy       = 0x00CC0020
	dtCenter      = 0x0001
	dtVCenter     = 0x0004
	dtSingleLine  = 0x0020
	dtNoPrefix    = 0x0800
	dtEndEllipsis = 0x8000

	clientW int32 = 760
	clientH int32 = 520
	logoMax int32 = 300
)

const (
	colorBg      uintptr = 0x00180C08
	colorTrack   uintptr = 0x00301C12
	colorBar     uintptr = 0x00FF9400
	colorBlue    uintptr = 0x00E87A0E
	colorBlueHot uintptr = 0x00FF9628
	colorText    uintptr = 0x00FAF2EC
	colorMuted   uintptr = 0x00CEB09A
	colorLine    uintptr = 0x00E6C8B4
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

type winRect struct {
	left, top, right, bottom int32
}

type paintStruct struct {
	hdc         uintptr
	erase       int32
	rc          winRect
	restore     int32
	incUpdate   int32
	rgbReserved [32]byte
}

type bitmapInfo struct {
	size          uint32
	width         int32
	height        int32
	planes        uint16
	bitCount      uint16
	compression   uint32
	sizeImage     uint32
	xPelsPerMeter int32
	yPelsPerMeter int32
	clrUsed       uint32
	clrImportant  uint32
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

type button struct {
	id         int
	text       string
	primary    bool
	x, y, w, h int32
}

var (
	mainWnd  uintptr
	fontText uintptr
	fontBold uintptr
	logoPix  []byte
	logoW    int32
	logoH    int32
	hoverID  int
	pressID  int
)

func runWindow() error {
	loadLogo()
	fontText = makeFont(18, 400)
	fontBold = makeFont(19, 700)
	className, _ := syscall.UTF16PtrFromString("AnimeHeroesLauncher")
	title, _ := syscall.UTF16PtrFromString("Anime Heroes")
	inst, _, _ := procGetModuleHandleW.Call(0)
	cursor, _, _ := procLoadCursorW.Call(0, 32512)
	wc := wndClassEx{
		cbSize:        uint32(unsafe.Sizeof(wndClassEx{})),
		lpfnWndProc:   syscall.NewCallback(wndProc),
		hInstance:     inst,
		hIcon:         loadIcon(inst, 11, 12),
		hCursor:       cursor,
		lpszClassName: className,
		hIconSm:       loadIcon(inst, 49, 50),
	}
	if r, _, err := procRegisterClassExW.Call(uintptr(unsafe.Pointer(&wc))); r == 0 {
		return err
	}
	style := uintptr(wsOverlapped | wsCaption | wsSysMenu | wsMinimizeBox)
	rc := winRect{0, 0, clientW, clientH}
	procAdjustWindowRectEx.Call(uintptr(unsafe.Pointer(&rc)), style, 0, 0)
	hwnd, _, err := procCreateWindowExW.Call(
		0,
		uintptr(unsafe.Pointer(className)),
		uintptr(unsafe.Pointer(title)),
		style,
		uintptr(cwUseDefault), uintptr(cwUseDefault),
		uintptr(rc.right-rc.left), uintptr(rc.bottom-rc.top),
		0, 0, inst, 0,
	)
	if hwnd == 0 {
		return err
	}
	mainWnd = hwnd
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
	case wmEraseBkgnd:
		return 1
	case wmPaint:
		paint(hwnd)
		return 0
	case wmMouseMove:
		if id := buttonAt(lparam); id != hoverID {
			hoverID = id
			redraw()
		}
		return 0
	case wmLButtonDown:
		if id := buttonAt(lparam); id != 0 && buttonEnabled(id) {
			pressID = id
			redraw()
		}
		return 0
	case wmLButtonUp:
		id := pressID
		pressID = 0
		redraw()
		if id != 0 && id == buttonAt(lparam) && buttonEnabled(id) {
			if id == idUpdate {
				theApp.startUpdate()
			}
			if id == idPlay {
				theApp.startPlay()
			}
		}
		return 0
	case wmStatus:
		redraw()
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

func paint(hwnd uintptr) {
	var ps paintStruct
	hdc, _, _ := procBeginPaint.Call(hwnd, uintptr(unsafe.Pointer(&ps)))
	mem, _, _ := procCreateCompatibleDC.Call(hdc)
	bmp, _, _ := procCreateCompatibleBitmap.Call(hdc, uintptr(clientW), uintptr(clientH))
	old := selectObj(mem, bmp)

	fillRect(mem, 0, 0, clientW, clientH, colorBg)
	logoBottom := drawLogo(mem)
	drawBody(mem, logoBottom)

	procBitBlt.Call(hdc, 0, 0, uintptr(clientW), uintptr(clientH), mem, 0, 0, srcCopy)
	selectObj(mem, old)
	procDeleteObject.Call(bmp)
	procDeleteDC.Call(mem)
	procEndPaint.Call(hwnd, uintptr(unsafe.Pointer(&ps)))
}

func drawLogo(hdc uintptr) int32 {
	if logoPix == nil {
		return 40
	}
	x := (clientW - logoW) / 2
	bi := bitmapInfo{size: 40, width: logoW, height: -logoH, planes: 1, bitCount: 32}
	procSetDIBitsToDevice.Call(hdc,
		uintptr(x), 0, uintptr(logoW), uintptr(logoH),
		0, 0, 0, uintptr(logoH),
		uintptr(unsafe.Pointer(&logoPix[0])), uintptr(unsafe.Pointer(&bi)), 0)
	return logoH
}

func drawBody(hdc uintptr, top int32) {
	uiMu.Lock()
	text, verify, update := uiText, uiVerify, uiUpdate
	uiMu.Unlock()
	if text == "" {
		text = "Verificando..."
	}
	const margin int32 = 32
	width := clientW - 2*margin
	y := top + 14
	drawText(hdc, fontText, colorText, text, margin, y, width, 26, dtCenter|dtVCenter|dtSingleLine|dtNoPrefix|dtEndEllipsis)
	drawBar(hdc, "Verificação", verify, margin, y+38, width)
	drawBar(hdc, "Atualização", update, margin, y+90, width)
	for _, b := range buttons() {
		drawButton(hdc, b)
	}
}

func drawBar(hdc uintptr, label string, pct int, x, y, w int32) {
	if pct < 0 {
		pct = 0
	}
	if pct > 100 {
		pct = 100
	}
	drawText(hdc, fontText, colorMuted, label, x, y, w-70, 22, dtVCenter|dtSingleLine|dtNoPrefix)
	drawText(hdc, fontText, colorText, itoa(pct)+"%", x+w-70, y, 70, 22, dtVCenter|dtSingleLine|dtNoPrefix|0x0002)
	barY := y + 26
	roundRect(hdc, x, barY, w, 12, colorTrack, colorTrack)
	fill := (w - 4) * int32(pct) / 100
	if pct > 0 && fill < 8 {
		fill = 8
	}
	if fill > 0 {
		roundRect(hdc, x+2, barY+2, fill, 8, colorBar, colorBar)
	}
}

func buttons() []button {
	const margin, gap int32 = 32, 16
	w := (clientW - 2*margin - gap) / 2
	y := clientH - 76
	return []button{
		{id: idUpdate, text: "Atualizar", primary: true, x: margin, y: y, w: w, h: 46},
		{id: idPlay, text: "Jogar", x: margin + w + gap, y: y, w: w, h: 46},
	}
}

func drawButton(hdc uintptr, b button) {
	enabled := buttonEnabled(b.id)
	hot := enabled && hoverID == b.id
	fillC, edge, textC := colorBg, colorLine, colorText
	switch {
	case !enabled:
		fillC, edge, textC = colorTrack, colorTrack, colorMuted
	case b.primary && hot:
		fillC, edge = colorBlueHot, colorBlueHot
	case b.primary:
		fillC, edge = colorBlue, colorBlue
	case hot:
		fillC = colorTrack
	}
	if enabled && pressID == b.id {
		fillC = colorBlue
	}
	roundRect(hdc, b.x, b.y, b.w, b.h, fillC, edge)
	drawText(hdc, fontBold, textC, b.text, b.x, b.y, b.w, b.h, dtCenter|dtVCenter|dtSingleLine|dtNoPrefix)
}

func buttonAt(lparam uintptr) int {
	x := int32(int16(lparam & 0xffff))
	y := int32(int16((lparam >> 16) & 0xffff))
	for _, b := range buttons() {
		if x >= b.x && x < b.x+b.w && y >= b.y && y < b.y+b.h {
			return b.id
		}
	}
	return 0
}

func buttonEnabled(id int) bool {
	uiMu.Lock()
	busy, canPlay := uiBusy, uiCanPlay
	uiMu.Unlock()
	switch id {
	case idUpdate:
		return !busy
	case idPlay:
		return !busy && canPlay
	}
	return false
}

func redraw() {
	if mainWnd != 0 {
		procInvalidateRect.Call(mainWnd, 0, 0)
	}
}

func setUI(text string, busy, canPlay bool) {
	setState(text, busy, canPlay, -1, -1)
}

func setState(text string, busy, canPlay bool, verify, update int) {
	uiMu.Lock()
	if text != "" {
		uiText = text
	}
	uiBusy = busy
	uiCanPlay = canPlay
	if verify >= 0 {
		uiVerify = verify
	}
	if update >= 0 {
		uiUpdate = update
	}
	uiMu.Unlock()
	if mainWnd != 0 {
		procPostMessageW.Call(mainWnd, wmStatus, 0, 0)
	}
}

func loadLogo() {
	img, _, err := image.Decode(bytes.NewReader(logoData))
	if err != nil {
		return
	}
	b := img.Bounds()
	sw, sh := int32(b.Dx()), int32(b.Dy())
	if sw == 0 || sh == 0 {
		return
	}
	dw, dh := clientW, clientW*sh/sw
	if dh > logoMax {
		dh = logoMax
		dw = logoMax * sw / sh
	}
	pix := make([]byte, int(dw)*int(dh)*4)
	for y := int32(0); y < dh; y++ {
		sy := b.Min.Y + int(y*sh/dh)
		for x := int32(0); x < dw; x++ {
			sx := b.Min.X + int(x*sw/dw)
			c := color.NRGBAModel.Convert(img.At(sx, sy)).(color.NRGBA)
			i := (int(y)*int(dw) + int(x)) * 4
			pix[i], pix[i+1], pix[i+2], pix[i+3] = c.B, c.G, c.R, 255
		}
	}
	logoPix, logoW, logoH = pix, dw, dh
}

func drawText(hdc, font, rgb uintptr, text string, x, y, w, h int32, flags uint32) {
	old := selectObj(hdc, font)
	procSetBkMode.Call(hdc, 1)
	procSetTextColor.Call(hdc, rgb)
	buf, _ := syscall.UTF16FromString(text)
	rc := winRect{x, y, x + w, y + h}
	procDrawTextW.Call(hdc, uintptr(unsafe.Pointer(&buf[0])), uintptr(len(buf)-1), uintptr(unsafe.Pointer(&rc)), uintptr(flags))
	selectObj(hdc, old)
}

func roundRect(hdc uintptr, x, y, w, h int32, fillC, edgeC uintptr) {
	brush, _, _ := procCreateSolidBrush.Call(fillC)
	pen, _, _ := procCreatePen.Call(0, 1, edgeC)
	oldB := selectObj(hdc, brush)
	oldP := selectObj(hdc, pen)
	r := h
	if r > 16 {
		r = 16
	}
	procRoundRect.Call(hdc, uintptr(x), uintptr(y), uintptr(x+w), uintptr(y+h), uintptr(r), uintptr(r))
	selectObj(hdc, oldB)
	selectObj(hdc, oldP)
	procDeleteObject.Call(brush)
	procDeleteObject.Call(pen)
}

func fillRect(hdc uintptr, x, y, w, h int32, c uintptr) {
	brush, _, _ := procCreateSolidBrush.Call(c)
	rc := winRect{x, y, x + w, y + h}
	procFillRect.Call(hdc, uintptr(unsafe.Pointer(&rc)), brush)
	procDeleteObject.Call(brush)
}

func loadIcon(inst uintptr, metricW, metricH uintptr) uintptr {
	w, _, _ := procGetSystemMetrics.Call(metricW)
	h, _, _ := procGetSystemMetrics.Call(metricH)
	icon, _, _ := procLoadImageW.Call(inst, 1, 1, w, h, 0)
	return icon
}

func makeFont(height, weight int) uintptr {
	name, _ := syscall.UTF16PtrFromString("Segoe UI")
	font, _, _ := procCreateFontW.Call(
		uintptr(height), 0, 0, 0, uintptr(weight),
		0, 0, 0, 1,
		0, 0, 5, 0,
		uintptr(unsafe.Pointer(name)),
	)
	return font
}

func selectObj(hdc, obj uintptr) uintptr {
	old, _, _ := procSelectObject.Call(hdc, obj)
	return old
}

func itoa(n int) string {
	if n <= 0 {
		return "0"
	}
	var buf [4]byte
	i := len(buf)
	for n > 0 {
		i--
		buf[i] = byte('0' + n%10)
		n /= 10
	}
	return string(buf[i:])
}
