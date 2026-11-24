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

[Command]
name = "DD"     ;Required (do not remove)
command = D, D
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
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------Basicos-----------------------------------------
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = ifelse(pos y >= 0,60,65)
trigger1 = command = "FF"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = ctrl
;========================PARRY=SYSTEM======================================
[state > parry]
type = changestate
triggerall = (roundstate = 2) && (ctrl) && (!numhelper(80015))
trigger1 = ((!ailevel) && (command != "hold_s") && ((command = "holddown") && (command = "y")))
value = 99600
ignorehitpause = 1
[state > dodge]
type = changestate
triggerall = (roundstate = 2) && (!numexplod(105)) && ((ctrl) || (stateno = 100))
trigger1 = (!ailevel) && (command != "hold_s") && (command != "holddown") && (command = "y")
value = cond(command = "holdback" && pos y >= 0, 107, cond(command = "holdfwd" && pos y >= 0, 106, 105))
;===========================================================================
;===========================================================================
; Specials:
;===========================================================================
; Shinra Tensei: Seiatsu
[State -1, Shinra Tensei: Seiatsu]
type = ChangeState
triggerall = teammode != simul
triggerall = var(9) != 1
triggerall = var(41) = 1
Triggerall = power >= powermax
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
; Pain Rikudo: Kuroi Jushin
[State -1, Pain Rikudo: Kuroi Jushin]
type = ChangeState
triggerall = teammode != simul
triggerall = var(9) = 1
triggerall = var(41) = 1
Triggerall = power >= powermax
value = 3100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shurado
[State -1, Shurado]
type = ChangeState
Triggerall = var(35)=0
Triggerall = numhelper(60000) = 0
Triggerall = numhelper(70000) = 0
Triggerall = numhelper(1020) = 0
Triggerall = power >= 1000
value = 1000
Triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shurado Awakening
[State -1, Shurado Awakening]
type = ChangeState
Triggerall = var(35)=1
Triggerall = var(36)=0
Triggerall = power >= 1000
value = 1001
Triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Ningendo: Kyukon no Jutsu
[State -1, Ningendo: Kyukon no Jutsu]
type = ChangeState
Triggerall = numhelper(30000) = 0
Triggerall = numhelper(1220) = 0
Triggerall = power >= 1500
value = 1200
Triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Jigokudo
[State -1, Jigokudo]
type = ChangeState
Triggerall = numhelper(50000) = 0
Triggerall = numhelper(1320) = 0
Triggerall = power >= 1500
value = 1300
Triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shinra Tensei
[State -1, Shinra Tensei]
type = ChangeState
triggerall = var(41) = 0
Triggerall = power >= 2000
value = 1602
Triggerall = command = "hold_s" && command = "y"
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Chibaku Tensei
[State -1, Chibaku Tensei]
type = ChangeState
triggerall = var(41) = 1
Triggerall = power >= 2000
value = 1500
Triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Gakido: Fujutsu Kyuin
[State -1, Gakido Fujutsu Kyuin]
type = ChangeState
Triggerall = numhelper(40000) = 0
Triggerall = numhelper(1120) = 0
Triggerall = power >= 1000
value = 1100
triggerall = command = "s"
triggerall = command = "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Rinnengan mode On
;[State -1, Rinnengan mode On]
;type = ChangeState
;triggerall = var(41) = 1
;triggerall = numhelper(9001) = 0 && numhelper(9002) = 0 && numhelper(9003) = 0 && numhelper(9004) = 0
;Triggerall = power >= 1000
;value = 1600
;triggerall = var(25) = 0
;triggerall = command = "x"
;Triggerall = statetype != A
;trigger1 = ctrl
;---------------------------------------------------------------------------
; Rinnengan Off
;[State -1, Rinnegan Off]
;type = ChangeState
;value = 1601
;triggerall = var(25) = 1
;triggerall = command = "holddown"
;triggerall = command = "s"
;Triggerall = statetype != A
;trigger1 = ctrl
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
[State -1, Kuchiyose no Jutsu: Chikushodo]
type       = ChangeState
value      = 10000
triggerall = var(41) = 1
triggerall = var(9) != 1
triggerall = !isHelper
triggerall = command = "x"
trigger1   = (statetype != A) && ctrl
trigger1   = ctrl
;-------------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 1
[State -1, Combo 1]
type = ChangeState
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 2
[State -1, Combo 2]
type = ChangeState
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 3
[State -1, Combo 3]
type = ChangeState
value = 400
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Air Combo
[State -1, Air Combo]
type = ChangeState
value = 600
triggerall = command = "a" || command = "b" || command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Shinra Tensei
;[State -1, Shinra Tensei]
;type = ChangeState
;triggerall = pos y < -50
;value = 640
;triggerall = command = "c"
;Triggerall = statetype = A
;trigger1 = ctrl