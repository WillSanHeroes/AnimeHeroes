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

;-| Default Values |-------------------------------------------------------
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

;---------- comandos para que la PC active la IA -------------------------
[command]
name = "AI1"
command = b,b,b,b,b,b,b,b,b,b,b
time = 1

[command]
name = "AI2"
command = b,c,b,c,b,c,b,c,b,c,b,c
time = 1

[command]
name = "AI3"
command = b,c,b,c,b,c,b,c,b,c,b
time = 1

[command]
name = "AI4"
command = a,b,a,b,a,b,a,b,a,b,a
time = 1

[command]
name = "AI5"
command = b,a,b,a,b,a,b,a,b,a,b
time = 1

[command]
name = "AI6"
command = b,b,b,b,z,b,z,b,z,z,z
time = 1

[command]
name = "AI7"
command = b,x,b,b,x,b,b,b,b,b,x
time = 1

[command]
name = "AI8"
command = b,y,b,b,b,y,b,b,b,b,y
time = 1

[command]
name = "AI9"
command = b,b,b,b,s,z,y,x,c,b,a
time = 1

[command]
name = "AI10"
command = z,b,x,y,b,b,c,b,b,b,a
time = 1

[command]
name = "AI11"
command = b,x,b,b,x,b,b,b,b,b,z
time = 1

[command]
name = "AI12"
command = b,y,b,s,b,y,b,b,b,b,y
time = 1

[command]
name = "AI13"
command = b,b,b,z,s,z,y,x,c,b,a
time = 1

[command]
name = "AI14"
command = z,b,x,y,b,b,c,b,b,c,a
time = 1
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------Basicos-----------------------------------------
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 0
value = 60
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 0
value = 70
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Adelante AIR
[State -1, Correr Adelante AIR]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 0
value = 100
trigger1 = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras AIR
[State -1, Correr Atras AIR]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 0
value = 106
trigger1 = command = "BB"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Adelante 2
[State -1, Correr Adelante 2]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 1
value = 2060
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras 2
[State -1, Correr Atras 2]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 1
value = 2070
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Adelante 2 AIR
[State -1, Correr Adelante 2 AIR]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 1
value = 2100
trigger1 = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras 2 AIR
[State -1, Correr Atras 2 AIR]
type = ChangeState
triggerall = power >= 100
triggerall = var(2) = 1
value = 2105
trigger1 = command = "BB"
trigger1 = statetype = A
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
[State -1, ULT]
type = ChangeState
Triggerall = power >= powermax
triggerall = teammode != simul
triggerall = var(41) = 1
triggerall = var(2) = 0
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
[State -1, SUPER]
type = ChangeState
Triggerall = power >= powermax
triggerall = teammode != simul
triggerall = var(41) = 1
triggerall = var(2) = 1
value = 4900
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;-------------------------------Transforms----------------------------------
;===========================================================================
[State -1, Awakenning End]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) > 0
value = 705
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
[State -1, Awakenning]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
value = 700
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;SPECIALS:
;===========================================================================
[State -1, Haki Attack]
type = ChangeState
Triggerall = power >= 1000
triggerall = var(2) = 0
value = 1008
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [200,499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, Spin]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 0
value = 1010
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [200,499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, Haoshoku Haki]
type = ChangeState
triggerall = numhelper(22022) = 0
Triggerall = power >= 1500
triggerall = var(2) = 0
value = 1400
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [200,499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, Ground Explod]
type = ChangeState
Triggerall = power >= 2000
triggerall = var(2) = 0
value = 1011
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [200,499]
trigger3 = movecontact = 1
;===========================================================================
;SPECIALS: DEVIL FRUIT
;===========================================================================
[State -1, SPECIAL 2]
type = ChangeState
Triggerall = power >= 1000
triggerall = var(41) = 1
triggerall = var(2) = 1
value = 1130
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, SPECIAL 3]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 1
value = 1110
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, SPECIAL 4]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 1
value = 1120
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, SUPER]
type = ChangeState
Triggerall = power >= 2000
triggerall = var(41) = 1
triggerall = var(2) = 1
value = 1300
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, SPECIAL 3]
type = ChangeState
Triggerall = power >= 2000
triggerall = var(41) = 0
triggerall = var(2) = 1
value = 4110
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;===========================================================================
;UNIQUES
;===========================================================================
[State -1, Counter]
type = ChangeState
Triggerall = power >= 500
triggerall = var(2) = 0
value = 1200
triggerall = command = "s"
triggerall = command = "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [200,499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
[State -1, Devil Fuit: Counter]
type = ChangeState
Triggerall = power >= 500
triggerall = var(2) = 1
value = 4100
triggerall = command = "s"
triggerall = command = "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
trigger3 = stateno = [2200,2499]
trigger3 = movecontact = 1
;---------------------------------------------------------------------------
;[State -1, Healing]
;type = ChangeState
;Triggerall = power >= 2000
;triggerall = var(2) = 0
;value = 1016
;triggerall = command = "SPECIAL 6" || command = "hold_s" && command = "c" && command = "holdback"
;Triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = numhelper(700) > 0
;trigger3 = stateno = [200,499]
;trigger3 = movecontact = 1
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;===========================================================================
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
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A
[State -1, A2]
type = ChangeState
triggerall = var(2) = 1
value = 2200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B2]
type = ChangeState
triggerall = var(2) = 1
value = 2300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
triggerall = var(2) = 0
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command = "s"
Trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge2]
type = ChangeState
triggerall = var(2) = 1
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 2500
triggerall = command = "s"
Trigger1 = statetype != A
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
value = 620
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = var(2) = 0
value = 400
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
triggerall = var(2) = 0
value = 610
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;-------------------------------------------------------------------------------
; A Aire
[State -1, A Aire2]
type = ChangeState
triggerall = var(2) = 1
value = 2600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire2]
type = ChangeState
triggerall = var(2) = 1
value = 2620
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = var(2) = 1
value = 4400
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire2]
type = ChangeState
triggerall = var(2) = 1
value = 2610
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;-------------------------------------------------------------------------------
