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

;[Command]
;name = "recovery"
;command = b+c
;time = 1

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
;BASIC COMMANDS
;---------------------------------------------------------------------------

; Jump
;[State -1, Jump]
;type = ChangeState
;;TriggerALL = Var(50)<1
;TriggerALL = statetype != A
;TriggerALL = command = "hold_a"
;trigger1 = ctrl
;value = 41

; Air Jump
;[State -1, Air Jump]
;type = ChangeState
;TriggerALL = Var(50)<1
;TriggerALL = statetype = A
;TriggerALL = command = "a"
;trigger1 = ctrl
;value = 45

; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = ailevel = 0
Triggerall = statetype != A
triggerall = command = "s"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Air Dash Forward
[State -1, Air Dash Forward]
type = ChangeState
triggerall = stateno != 110
triggerall = stateno != 115
value = 110
triggerall = ailevel = 0
trigger1 = command = "FF"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Air Dash Backwards
[State -1, Air Dash Backwards]
type = ChangeState
triggerall = stateno != 110
triggerall = stateno != 115
value = 115
triggerall = ailevel = 0
trigger1 = command = "BB"
trigger1 = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Run
[State -1, Run]
type = ChangeState
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = 60
triggerall = ailevel = 0
trigger1 = command = "FF"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Quick Step Backwards
[State -1, Quick Step Backwards]
type = ChangeState
triggerall = stateno != 60
triggerall = stateno != 70
value = 70
triggerall = ailevel = 0
trigger1 = command = "BB"
trigger1 = statetype != A
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
; ULTIMATE =================================================================
;===========================================================================
[State -1, ULTIMATE]
type = ChangeState
Triggerall = power >= powermax
triggerall = teammode != simul
triggerall = var(41) = 1
TriggerALL = command = "z"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
value = 3000
;===========================================================================
; SPECIALS =================================================================
;===========================================================================
;COUNTER IMPACT
[State -1, SPECIAL 4]
type = ChangeState
triggerall = var(2) = 0
TriggerALL = Power >= 1000
triggerall = command = "hold_s" && command = "a"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1300

;MIGHTY PUNISHMENT
[State -1, SPECIAL 1]
type = ChangeState
TriggerALL = Power >= 1000
triggerall = command = "hold_s" && command = "a"
TriggerALL = statetype = A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1050

;MIGHTY PUNISHMENT
[State -1, SPECIAL 2]
type = ChangeState
triggerall = var(2) = 1
TriggerALL = Power >= 1000
triggerall = command = "hold_s" && command = "a"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1100

[State -1, SPECIAL 1];MIGHTY PUNISHMENT
type = ChangeState
TriggerALL = Power >= 1500
triggerall = command = "hold_s" && command = "b"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1000

[State -1, SPECIAL 5 on air]
type = ChangeState
TriggerALL = Power >= 1500
triggerall = command = "hold_s" && command = "b"
TriggerALL = statetype = A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1450

[State -1, SPECIAL 3];GRAND CHARGE
type = ChangeState
triggerall = var(2) = 0
TriggerALL = Power >= 1500
triggerall = command = "hold_s" && command = "c"
TriggerALL = statetype != C
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1200

[State -1, SPECIAL 5 phantom mode];Fire metteor
type = ChangeState
triggerall = var(2) = 1
TriggerALL = Power >= 1500
triggerall = command = "hold_s" && command = "c"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 4400

[State -1, SPECIAL 5];Fire metteor
type = ChangeState
triggerall = var(2) = 0
triggerall = var(41) = 0
TriggerALL = Power >= 2000
triggerall = command = "hold_s" && command = "y"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1400

;Fire field
[State -1, SPECIAL 6]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(41) = 1
TriggerALL = Power >= 2000
triggerall = command = "hold_s" && command = "y"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 1500
[State -1, SPECIAL 6 phantom mode];Fire field
type = ChangeState
triggerall = var(2) = 1
TriggerALL = Power >= 2000
triggerall = command = "hold_s" && command = "y"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [200,499]
trigger2 = movecontact = 1
value = 4500
;===========================================================================
;PHANTOM MODE==============================================================
;===========================================================================
[State -1, phantom mode];phantom mode
type = ChangeState
triggerall = var(2) = 0
triggerall = var(41) = 1
TriggerALL = command = "x"
TriggerALL = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
value = 600

;[State 0, Phantom mode end]
;type = ChangeState
;TriggerALL = statetype != A
;triggerall = var(2) = 1
;trigger1 = numhelper(655)
;Trigger2 = ailevel = 0 && command = "holddown"
;Trigger2 = ailevel = 0 && command = "s"
;Triggerall = ctrl
;value = 601
;===========================================================================
; LIGHT ATTACKS ============================================================
;===========================================================================

; Standing A
[State -1, Standing A]
type = ChangeState
TriggerALL = command != "holddown"
TriggerALL = statetype != A
TriggerALL = command = "a"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 200

;Down+A
[State -1, Down+A]
type = ChangeState
TriggerALL = statetype != A
TriggerALL = command = "holddown"
TriggerALL = command = "a"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 230

; Aerial A
[State -1, Aerial A]
type = ChangeState
TriggerALL = statetype = A
TriggerALL = command = "a"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 245

;===========================================================================
; HEAVY ATTACKS ============================================================
;===========================================================================

[State -1, Standing B];Standing B
type = ChangeState
TriggerALL = statetype != A
TriggerALL = command != "holddown"
TriggerALL = command = "b"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 300

;Down+B
[State -1, Down+B]
type = ChangeState
TriggerALL = statetype != A
TriggerALL = command = "holddown"
TriggerALL = command = "b"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 330


; Aerial B
[State -1, Aerial B]
type = ChangeState
TriggerALL = statetype = A
TriggerALL = command = "b"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 345


;===========================================================================
; CHARACTER SKILLS =========================================================
;===========================================================================

;Down+C
[State -1, Down+C]
type = ChangeState
triggerall = var(2) = 0
TriggerALL = Power >= 350
TriggerALL = statetype != A
TriggerALL = command = "holddown"
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 450

; Standing C
[State -1, Standing C]
type = ChangeState
triggerall = var(2) = 0
triggerall = numhelper(9001) = 0
TRIGGERALL = NumHelper(405)=0
TriggerALL = Power >= 500
TriggerALL = statetype != A
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 400


; Aerial C
[State -1, Aerial C]
type = ChangeState
triggerall = var(2) = 0
TriggerALL = Power >= 350
TriggerALL = statetype = A
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 445
;===========================================================================
; phantom SKILLS =========================================================
;===========================================================================
; Standing C
[State -1, Standing C]
type = ChangeState
triggerall = var(2) = 1
TRIGGERALL = NumHelper(405)=0
TriggerALL = Power >= 500
TriggerALL = statetype != A
TriggerALL = command != "holddown"
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 605

;Down+C
[State -1, Down+C]
type = ChangeState
triggerall = var(2) = 1
TriggerALL = Power >= 350
TriggerALL = statetype != A
TriggerALL = command = "holddown"
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 606

; Aerial C
[State -1, Aerial C]
type = ChangeState
triggerall = var(2) = 1
TriggerALL = Power >= 350
TriggerALL = statetype = A
TriggerALL = command = "c"
triggerall = ailevel = 0
Trigger1 = ctrl
value = 608




