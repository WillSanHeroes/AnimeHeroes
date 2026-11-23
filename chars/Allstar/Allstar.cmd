;===============================================================================
;-------------------------------Comandos----------------------------------------
;===============================================================================
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[Command]
name = "Super Jump"
command = ~D,U
time = 10

;-| Specials |-------------------------------------------------------
[command]
name = "SPECIAL 1"
command = D,F,a
time = 15

[command]
name = "SPECIAL 2"
command = D,B,a
time = 15

[command]
name = "SPECIAL 3"
command = D,F,b
time = 15

[command]
name = "SPECIAL 4"
command = D,B,b
time = 15

[command]
name = "SPECIAL 5"
command = D,F,c
time = 15

[command]
name = "SPECIAL 6"
command = D,B,c
time = 15

[Defaults]

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1
;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1
;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1
;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1
;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1
;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1
;---------- Comandos de la Inteligencia Artificial-----------------
; Comandos activadores
[Command]
name = "AI Prueba"
command = y+z ; con el botón A+B activamos la AI
time = 1

[Command]
name = "AI desactivado"
command = b+c ; Con el boton B+C desactivamos la AI
time = 1
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------Basicos-----------------------------------------
;================
;CORRER BASE
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = var(3) != 1
triggerall = var(4) < 1
triggerall = numhelper(1660) = 0
triggerall = stateno != 60
triggerall = stateno != 70
value = 60
trigger1 = command = "FF"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
triggerall = var(3) != 1
triggerall = var(4) < 1
triggerall = numhelper(1660) = 0
triggerall = stateno != 60
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;================
;CORRER HAKI
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = var(5) = 1
triggerall = numhelper(1660) = 0
triggerall = stateno != 60
triggerall = stateno != 70
value = 60
trigger1 = command = "FF"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
triggerall = var(5) = 1
triggerall = numhelper(1660) = 0
triggerall = stateno != 60
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;================
;CORRER ASHURA
;---------------------------------------------------------------------------
; Tp Adelante
[State -1, Tp Adelante]
type = ChangeState
triggerall = var(5) != 1
triggerall = var(3) != 1
triggerall = var(4) = 1
value = 61
trigger1 = command = "FF"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Tp Atras
[State -1, Tp Atras]
type = ChangeState
triggerall = var(5) != 1
triggerall = var(3) != 1
triggerall = var(4) = 1
value = 71
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;================
;TP RINNEGAN
;---------------------------------------------------------------------------
; Tp Adelante
[State -1, Tp Adelante]
type = ChangeState
triggerall = var(3) != 1
triggerall = numhelper(1660) = 1
value = 61
trigger1 = command = "FF"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Tp Atras
[State -1, Tp Atras]
type = ChangeState
triggerall = var(3) != 1
triggerall = numhelper(1660) = 1
value = 71
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;================
;Tp Ui
;---------------------------------------------------------------------------
; Tp Adelante
[State -1, Tp Adelante]
type = ChangeState
triggerall = var(5) != 1
triggerall = var(3) = 1
value = 62
trigger1 = command = "FF"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Tp Atras
[State -1, Tp Atras]
type = ChangeState
triggerall = var(5) != 1
triggerall = var(3) = 1
value = 72
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Super Jump
[State -1, Super Jump]
type = ChangeState
value = 80
trigger1 = command = "Super Jump"
trigger1 = statetype = S
trigger1 = ctrl
;===========================================================================
;SUPERS:
;===========================================================================
; Cho Genkidama
[State -1, Cho Genkidama]
type = ChangeState
triggerall = teammode != simul
Triggerall = power >= powermax
triggerall = var(2) = 2 && var(4) = 1 && var(5) = 1 || var(3) = 1 && var(4) = 1 && var(5) = 1
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;SPECIALS:
;===========================================================================
; Rasengan
[State -1, Rasengan]
type = ChangeState
Triggerall = power >= 1000
value = 1000
triggerall = command = "SPECIAL 1" || command = "hold_s" && command = "a" && command = "holdfwd"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Ki wave
[State -1, Ki wave]
type = ChangeState
Triggerall = power >= 1000
value = 1100
triggerall = command = "SPECIAL 2" || command = "hold_s" && command = "a" && command = "holdback"
trigger1 = ctrl

; JaJan ken
[State -1, JaJan ken]
type = ChangeState
Triggerall = power >= 1000
value = 1200
triggerall = command = "SPECIAL 3" || command = "hold_s" && command = "b" && command = "holdfwd"
Triggerall = statetype != A
trigger1 = ctrl

; Jutsu
[State -1, Jutsu]
type = ChangeState
Triggerall = power >= 1000
value = 1300
triggerall = command = "SPECIAL 4" || command = "hold_s" && command = "b" && command = "holdback"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Kamehameha
[State -1, Kamehameha]
type = ChangeState
Triggerall = power >= 1000
value = 1400
triggerall = command = "SPECIAL 5" || command = "hold_s" && command = "c" && command = "holdfwd"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Big bang attack
[State -1, Big bang attack]
type = ChangeState
triggerall = numhelper(1521) = 0
triggerall = numhelper(1522) = 0
triggerall = numhelper(1523) = 0
Triggerall = power >= 1000
value = 1500
triggerall = command = "SPECIAL 6" || command = "hold_s" && command = "c" && command = "holdback"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Sharingan
[State -1, Sharingan Rinnegan]
type = ChangeState
triggerall = var(20) = 0
trigger1 = numhelper(1650) = 0
trigger1 = numhelper(1660) = 0
Triggerall = power >= 1000
value = 1601
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Rinnegan 
[State -1, Rinnegan]
type = ChangeState
triggerall = var(20) = 0
trigger1 = numhelper(1650) = 1
trigger1 = numhelper(1660) = 0
Triggerall = power >= 1000
value = 1602
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

; Kiuby
[State -1, Kiuby]
type = ChangeState
triggerall = numhelper(33000) = 0
triggerall = numhelper(9996) < 1
Triggerall = var(4) = 1
Triggerall = power >= 2000
value = 1700
triggerall = command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

;===========================================================================
; TRANSFORM
; Destransformar
[State -1, Destransformar]
type = ChangeState
trigger1 = var(2) != 0
trigger2 = var(3) != 0
trigger3 = var(4) != 0
value = 800
triggerall = command = "holddown"
triggerall = command = "s"
Triggerall = statetype != A
triggerall = ctrl

[State -1, Haki OFF]
type = ChangeState
trigger1 = var(5) = 1
value = 806
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
triggerall = ctrl

; SS1
[State -1, SS1]
type = ChangeState
triggerall = var(3) = 0
triggerall = var(2) < 1
Triggerall = power >= 500
value = 801
triggerall = command != "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl

; SSV
[State -1, SSV]
type = ChangeState
triggerall = var(3) = 0
triggerall = var(2) = 1
Triggerall = power >= 500
value = 802
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl

[State -1, SSV Direct]
type = ChangeState
triggerall = var(3) = 0
triggerall = var(2) = 0
Triggerall = power >= 500
value = 802
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl

; Ultra instinct
[State -1, Ultra instinct]
type = ChangeState
triggerall = var(3) = 0
Triggerall = power >= powermax
value = 803
triggerall = command != "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl

; Ashura mode
[State -1, Ashura mode]
type = ChangeState
triggerall = var(4) = 0
Triggerall = power >= 500
value = 804
triggerall = command = "y"
Triggerall = statetype != A
trigger1 = ctrl

; Haki mode
[State -1, Haki mode]
type = ChangeState
triggerall = var(5) != 1
Triggerall = power >= 500
value = 805
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl


; Susano O
[State -1, Susano O]
type = ChangeState
triggerall = numhelper(33650) = 0
triggerall = numhelper(36000) = 0
Triggerall = power >= 1000
value = 35000
triggerall = command != "holddown"
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl

; Susano O perfect
[State -1, Susano O perfect]
type = ChangeState
triggerall = numhelper(38000) = 0
Triggerall = power >= 2000
value = 39000
triggerall = command = "holddown"
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
triggerall = var(3) != 1
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl

; B
[State -1, B]
type = ChangeState
triggerall = var(3) != 1
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl

; A Aire
[State -1, A Aire]
type = ChangeState
triggerall = var(3) != 1
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl

; B Aire
[State -1, B Aire]
type = ChangeState
triggerall = var(3) != 1
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
value = 400
triggerall = var(4) = 0
triggerall = numhelper(9001) = 0
triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = power < powermax
triggerall = numhelper(4002) = 0
triggerall = numhelper(4003) = 0
value = 500
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
value = 620
triggerall = var(4) = 0
triggerall = numhelper(9001) = 0
triggerall = power >= 300
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl

;===========================================================================
;---------------------------------------------------------------------------
; C Ashura mode
[State -1, C air]
type = ChangeState
value = 620
triggerall = var(4) = 1
triggerall = numhelper(2450) = 1
triggerall = power >= 300
triggerall = command = "c"
Triggerall = statetype != S
trigger1 = ctrl

[State -1, C]
type = ChangeState
value = 2400
triggerall = var(4) = 1
triggerall = numhelper(2450) = 0
triggerall = power >= 300
triggerall = command = "c"
Triggerall = statetype != C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Ultra instinct combo
; A
[State -1, A Ui]
type = ChangeState
triggerall = var(3) = 1
value = 21200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl

; B
[State -1, B Ui]
type = ChangeState
triggerall = var(3) = 1
value = 21300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl

; A Aire
[State -1, A Aire Ui]
type = ChangeState
triggerall = var(3) = 1
value = 21600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl

; B Aire
[State -1, B Aire Ui]
type = ChangeState
triggerall = var(3) = 1
value = 21610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl



