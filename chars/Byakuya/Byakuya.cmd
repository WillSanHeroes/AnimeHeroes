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
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = var(5) = 0
triggerall = var(2) = 0
triggerall = power >= 100
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
triggerall = var(5) = 0
triggerall = var(2) = 0
triggerall = power >= 100
triggerall = stateno != 60
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = statetype != C
trigger1 = ctrl
;===========================================================================
[state > parry]
type = changestate
triggerall = (roundstate = 2) && (ctrl) && (!numhelper(80015))
trigger1 = ((!ailevel) && (command != "hold_s") && ((command = "holddown") && (command = "y")))
value = 99600
ignorehitpause = 1
;===========================================================================
[state > dodge]
type = changestate
triggerall = (roundstate = 2) && (!numexplod(105)) && ((ctrl) || (stateno = 100))
trigger1 = (!ailevel) && (command != "hold_s") && (command != "holddown") && (command = "y")
value = cond(command = "holdback" && pos y >= 0, 107, cond(command = "holdfwd" && pos y >= 0, 106, 105))
;===========================================================================
;ULTIMATES:
;===========================================================================
; Chire: Dai Senbonzakura
[State -1, Chire: Dai Senbonzakura]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(1) = 0
triggerall = var(2) = 0
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Shukei Hakuteiken (Senkei)
[State -1, Shukei Hakuteiken]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(1) = 1
triggerall = teammode != simul
triggerall = numhelper(9002) = 0
Triggerall = power >= powermax
value = 720
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Goukei Senbonzakura (Bankai)
[State -1, Goukei Senbonzakura]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;SKILLS: BASE
;===========================================================================
; Shunpo Attack
[State -1, Shunpo Attack]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = power >= 1000
value = 1000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Bakudo 61: Rikujokoro | Sword Prison
[State -1, Bakudo 61: Rikujokoro | Sword Prison]
type = ChangeState
Triggerall = var(2) = 0
triggerall = numhelper(521) = 0
Triggerall = power >= 1500
value = 520
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Hadou 4: Byakurai
[State -1, Hadou 4: Byakurai]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = power >= 1500
value = 1200
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Chire: Senbonzakura
[State -1, Chire Senbonzakura]
type = ChangeState
Triggerall = var(1) = 0
Triggerall = var(2) = 0
Triggerall = power >= 2000
value = 1400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;SKILLS: BANKAI
;===========================================================================
; Senbonzakura: Barrier
[State -1, Senbonzakura Barrier]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
value = 1600
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Reactive Senbonzakura
[State -1, Reactive Senbonzakura]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
value = 1800
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Senbonzakura: Control
[State -1, Control Senbonzakura]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
value = 1700
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Cho Senbonzakura
[State -1, Cho Senbonzakura]
type = ChangeState
Triggerall = var(1) = 0
triggerall = var(2) = 1
Triggerall = power >= 2000
value = 1500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Hadou 33 Sokatsui
[State -1, Hadou 33 Sokatsui]
type = ChangeState
Triggerall = var(1) = 1
Triggerall = power >= 2000
value = 530
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;UNIQUES:
;===========================================================================
; Bakudou 81: Danku
[State -1, Bakudou 81: Danku]
type = ChangeState
triggerall = var(2) != 1
Triggerall = power >= 1000
value = 1100
triggerall = command = "holddown" && command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;AWAKE TRANSFORMS
;===========================================================================
; Bankai Fin
[State -1, Bankai Fin]
type = ChangeState
value = 705
triggerall = var(2) = 1
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Bankai: Senbonzakura Kageyoshi
[State -1, Bankai]
type = ChangeState
value = 700
triggerall = var(41) = 1
triggerall = var(2) = 0
triggerall = var(1) = 0
triggerall = numhelper(715) = 0
triggerall = numhelper(9002) = 0
triggerall = command = "x"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Senkei: Senbonzakura Kageyoshi
[State -1, Bankai: Senkei]
type = ChangeState
value = 710
triggerall = palno < 10
triggerall = var(41) = 1
triggerall = var(2) = 1
triggerall = var(1) = 0
triggerall = stateno != 710
triggerall = numhelper(9002) = 0
triggerall = command = "x"
trigger1 = statetype != A
trigger1 = ctrl
;===========================================================================
;POWER CHARGE:
;===========================================================================
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command != "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------

; A
[State -1, A]
type = ChangeState
triggerall = var(2) = 0
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(1) = 0
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(1) = 0
triggerall = numhelper(9001) = 0
value = 220
triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
triggerall = var(2) = 0
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(1) = 0
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(1) = 0
triggerall = numhelper(9001) = 0
value = 620
triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl

; A: Bankai
[State -1, A: Bankai]
type = ChangeState
triggerall = power >= 50
triggerall = var(2) = 1
triggerall = var(1) = 0
value = 800
triggerall = command != "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;--------------------------------------------------------------------------
; B: Bankai
[State -1, B: Bankai]
type = ChangeState
triggerall = power >= 50
triggerall = var(2) = 1
triggerall = var(1) = 0
value = 810
triggerall = command != "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;--------------------------------------------------------------------------
; C: Bankai
[State -1, C: Bankai]
type = ChangeState
triggerall = power >= 500
triggerall = var(2) = 1
triggerall = var(1) = 0
triggerall = numhelper(9003) = 0
value = 605
triggerall = command != "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;--------------------------------------------------------------------------
; A,B,C Aire: Bankai
[State -1, A,B,C: Bankai]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(1) = 0
triggerall = numhelper(9001) = 0
triggerall = power >= 200
value = 620
triggerall = command = "a" || command = "b" || command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;--------------------------------------------------------------------------
; B: Senkei
[State -1, B: Senkei]
type = ChangeState
triggerall = var(1) = 1
triggerall = numhelper(9004) = 0
value = 717
triggerall = command = "b"
trigger1 = ctrl
;---------------------------------------------------------------------------
; C: Senkei
[State -1, C: Senkei]
type = ChangeState
triggerall = var(1) = 1
triggerall = numhelper(521) = 0
triggerall = numhelper(40002) = 0
Triggerall = power >= 300
value = 4100
triggerall = command = "c"
trigger1 = ctrl
;---------------------------------------------------------------------------