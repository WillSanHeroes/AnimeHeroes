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
triggerall = !ailevel
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
triggerall = !ailevel
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
;===========================================================================
;TRANSFORMATIONS:
;===========================================================================
; Awake Fin
[State -1, Awake Fin]
type = ChangeState
triggerall = var(2) = 1
triggerall = !ailevel
value = 705
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; SS
[State -1, SS]
type = ChangeState
trigger1 = var(2) = 0
triggerall = var(41) = 1
triggerall = !ailevel
value = 700
triggerall = command = "x"
Triggerall = statetype != A
triggerall = ctrl
;---------------------------------------------------------------------------
; LSS
[State -1, LSS]
type = ChangeState
trigger1 = var(2) = 1
triggerall = var(41) = 1
triggerall = numhelper(9996) < 1
triggerall = !ailevel
value = 800
triggerall = command = "x"
Triggerall = statetype != A
triggerall = ctrl
;---------------------------------------------------------------------------
; Super Dash
[State -1, Super Dash]
type = ChangeState
value = 690
triggerall = !ailevel
triggerall = var(14) = 0
triggerall = power >= 200
triggerall = command = "holddown"
triggerall = command = "hold_s"
trigger1 = ctrl
;===========================================================================
;SUPERS:
;===========================================================================
; Eraser Cannon
[State -1, Eraser Cannon]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
triggerall = !ailevel
value = 3000
triggerall = command = "z"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Super Explosive Wave
[State -1, Super Explosive Wave]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
triggerall = !ailevel
value = 23000
triggerall = command = "z"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Gigantic Meteor
[State -1, Gigantic Meteor]
type = ChangeState
triggerall = var(2) = 2
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
triggerall = !ailevel
value = 202900
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
; Gigantic Meteor Air
[State -1, Gigantic Meteor Air]
type = ChangeState
triggerall = var(2) = 2
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
triggerall = !ailevel
value = 203000
triggerall = command = "z"
Triggerall = statetype = A
trigger1 = ctrl
;===========================================================================
;SPECIALS:
;===========================================================================
; Gigantic Charge
[State -1, Gigantic Charge]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1000
triggerall = !ailevel
value = 1100
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl

; Explosive Wave AIR
[State -1, Explosive Wave AIR]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1000
triggerall = !ailevel
value = 1000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 200||stateno = 210||stateno = 220||stateno = 230) && movecontact
trigger3 = (stateno = 300||stateno = 310||stateno = 320) && movecontact
trigger4 = inguarddist && stateno = [120,155]
;---------------------------------------------------------------------------
; Bloody Smash
[State -1, Bloody Smash]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
triggerall = !ailevel
value = 1205
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200||stateno = 210||stateno = 220||stateno = 230) && movecontact
trigger3 = (stateno = 300||stateno = 310||stateno = 320) && movecontact
;---------------------------------------------------------------------------
; Eraser Bomb
[State -1, Eraser Bomb]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
triggerall = !ailevel
value = 1300
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Full Power Energy Wave
[State -1, Full Power Energy Wave]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 2000
triggerall = !ailevel
value = 1400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;===========================================================================
;SPECIALS SS:
;===========================================================================
; Eraser Shot Volley
[State -1, Eraser Shot Volley]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(3) = 0
Triggerall = power >= 1000
triggerall = !ailevel
value = 21100
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl

; Trap Shooter
[State -1, Trap Shooter]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(3) = 1
Triggerall = power >= 1000
triggerall = !ailevel
value = 21300
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Gigantic Stomp
[State -1, Gigantic Stomp]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
triggerall = !ailevel
value = 21200
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Gigantic Knuckle
[State -1, Gigantic Knuckle]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(3) = 0
Triggerall = power >= 1500
triggerall = !ailevel
value = 21000
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200||stateno = 210||stateno = 220||stateno = 230) && movecontact
trigger3 = (stateno = 300||stateno = 310||stateno = 320||stateno = 10430) && movecontact
;---------------------------------------------------------------------------
; Eraser Cannon
[State -1, Eraser Cannon]
type = ChangeState
triggerall = var(2) = 1
triggerall = var(3) = 1
Triggerall = power >= 1500
triggerall = !ailevel
value = 21400
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Blaster Field
[State -1, Blaster Field]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 2000
triggerall = !ailevel
value = 21500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Gigantic Claw
[State -1, Gigantic Claw]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1000
triggerall = !ailevel
value = 201002
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Eraser Blow
[State -1, Eraser Blow]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1500
triggerall = !ailevel
value = 201100
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
trigger2 = (stateno = 200||stateno = 210||stateno = 220||stateno = 230||stateno = 200240) && movecontact
trigger3 = (stateno = 300||stateno = 310||stateno = 320||stateno = 10430||stateno = 200340) && movecontact
;---------------------------------------------------------------------------
; Eraser Cannon, Planet Geyser
[State -1, Eraser Cannon, Planet Geyser]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1500
triggerall = !ailevel
value = ifelse(pos y < -15,201301,21400)
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Blaster Meteor
[State -1, Blaster Meteor]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 2000
triggerall = !ailevel
value = 201500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Powered Shell Passive
;[State -1, Powered Shell Passive]
;type = ChangeState
;triggerall = var(2) = 0 && var(2) = 1
;Triggerall = power >= 1000
;triggerall = !ailevel
;value = 1600
;triggerall = command = "c"
;triggerall = command = "holddown"
;Triggerall = statetype = S || statetype = A || statetype = C
;trigger1 = ctrl
;---------------------------------------------------------------------------
; Powered Shield
[State -1, Powered Shield]
type = ChangeState
triggerall = var(4) = 0
Triggerall = power >= 1000
triggerall = !ailevel
value = 1700
triggerall = command = "c"
triggerall = command = "holddown"
Triggerall = statetype = S || statetype = A || statetype = C
trigger1 = ctrl
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
value = 200
triggerall = !ailevel
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
value = 300
triggerall = !ailevel
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Explosive Wave (Basic)
;[State -1, Explosive Wave (Basic)]
;type = ChangeState
;triggerall = var(2) >= 1
;Triggerall = power >= 300
;triggerall = !ailevel
;value = 10009
;triggerall = command = "c" && command = "holddown"
;Triggerall = statetype = S || statetype = A || statetype = C
;trigger1 = ctrl
;trigger2 = inguarddist && stateno = [120,155]
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
value = 400
triggerall = numhelper(9001) = 0
triggerall = !ailevel
triggerall = power >= 200
triggerall = command = "c"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
triggerall = !ailevel
value = 500
triggerall = command != "holddown"
triggerall = command = "s"
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
value = 600
triggerall = !ailevel
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire Down
[State -1, B Aire]
type = ChangeState
value = 10750
triggerall = var(2) >= 1
triggerall = !ailevel
triggerall = command = "b"
triggerall = command = "holddown"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
value = 620
triggerall = !ailevel
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
value = 640
triggerall = numhelper(9001) = 0
triggerall = !ailevel
triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
