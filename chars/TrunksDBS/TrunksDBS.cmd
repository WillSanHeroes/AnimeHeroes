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
command = y+z ; con el botÃ³n A+B activamos la AI
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
triggerall = stateno != 60
triggerall = stateno != 70
value = 70
trigger1 = command = "BB"
trigger1 = statetype != C
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
;---------------------------------------------------------------------------
;[State -1, Super Dash]
;type = ChangeState
;value = 10000
;triggerall = power >= 300
;triggerall = command = "y"
;trigger1 = ctrl
;trigger2 = numhelper(700) > 0
;===========================================================================
;SUPERS:
;===========================================================================
; Sword Combo
[State -1, Sword Combo]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Rushing Super Galick Ho
[State -1, Rushing Super Galick Ho]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(4) = 0
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Sword of Hope
[State -1, Sword of Hope]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(4) = 1
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3200
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;===========================================================================
;SPECIALS:
;===========================================================================
; Speed Slash
[State -1, Speed Slash]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1000
value = 1000
triggerall = command = "hold_s" && command = "a"
trigger1 = ctrl
trigger2 = movecontact
Triggerall = statetype != A
;---------------------------------------------------------------------------
; Rush Attack
[State -1, Rush Attack]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
value = 1200
triggerall = command = "hold_s" && command = "b"
trigger1 = ctrl
trigger2 = movecontact
Triggerall = statetype != A
;---------------------------------------------------------------------------
; Masenko
[State -1, Masenko]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
value = 1500
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Galick Ho
[State -1, Galick Ho]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 2000
value = 1400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;===========================================================================
;Super Saiyan 2
;---------------------------------------------------------------------------
; Rapid Slash
[State -1, Rapid Slash]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
value = 32000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Burning Attack
[State -1, Burning Attack]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 1
triggerall = var(4) = 0
value = 32600
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Burning Attack
[State -1, Burning Attack]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 1
triggerall = var(4) = 1
value = 32700
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Big Bang Attack
[State -1, Big Bang Attack]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
value = 30200
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Final Flash
[State -1, Final Flash]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(4) = 0
Triggerall = power >= 2000
value = 30400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;---------------------------------------------------------------------------
; Maximum Flasher
[State -1, Maximum Flasher]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(4) = 1
Triggerall = power >= 2000
value = 32400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; SS2 Fin
[State -1, SS2 Fin]
type = ChangeState
triggerall = ailevel = 0
triggerall = var(2) = 1
Triggerall = var(4) = 0
value = 905
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl

; SS2
[State -1, SS2]
type = ChangeState
triggerall = ailevel = 0
Triggerall = var(2) = 0
triggerall = var(41) = 1
value = 900
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl

; SSR
[State -1, SSR]
type = ChangeState
triggerall = numhelper(9996) < 1
Triggerall = var(2) = 1
Triggerall = var(4) = 0
triggerall = var(6) = 0
triggerall = var(41) = 1
value = 801
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Explosive Wave
[State -1, Explosive Wave]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 500
value = 1100
triggerall = command = "holddown"
triggerall = command = "c"
trigger1 = ctrl
trigger2 = movecontact
Triggerall = statetype != A

; Super Explosive Wave
[State -1, Super Explosive Wave]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 500
value = 32100
triggerall = command = "holddown"
triggerall = command = "c"
trigger1 = ctrl
trigger2 = numhelper(700) > 0
Triggerall = statetype != A
;---------------------------------------------------------------------------
; Rage
[State -1, Rage]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(3) = 0
triggerall = numhelper(9002) = 0
Triggerall = power >= 1000
value = 1300
triggerall = command = "holddown"
triggerall = command = "s"
trigger1 = ctrl
Triggerall = statetype != A

; Wild Sense
[State -1, Wild Sense]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(6) = 0
triggerall = numhelper(9002) = 0
Triggerall = power >= 1000
value = 32300
triggerall = command = "holddown"
triggerall = command = "s"
trigger1 = ctrl
Triggerall = statetype != A
;---------------------------------------------------------------------------
; A
[State -1, A BASE || SS2]
type = ChangeState
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Down+B
[State -1, Down+B]
type = ChangeState
value = 320
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Down+B Aire
[State -1, Down+B]
type = ChangeState
value = 615
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
value = 400
triggerall = power >= 250
triggerall = numhelper(9001) = 0
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command = "s"
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire BASE
[State -1, A Aire BASE]
type = ChangeState
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire BASE
[State -1, B Aire BASE]
type = ChangeState
triggerall = var(2) = 0
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire SS2
[State -1, B Aire SS2]
type = ChangeState
triggerall = var(2) = 1
value = 11610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
value = 620
triggerall = numhelper(9001) = 0
triggerall = power >= 250
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
