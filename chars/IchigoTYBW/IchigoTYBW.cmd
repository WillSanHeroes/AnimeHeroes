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
Command = ~D,U
time = 10

;-| Specials |-------------------------------------------------------
[Command]
name = "SPECIAL 1"
Command = ~D,DF,F,a
time = 15

[Command]
name = "SPECIAL 2"
Command = ~D,DB,B,a
time = 15

[Command]
name = "SPECIAL 3"
Command = ~D,DF,F,b
time = 15

[Command]
name = "SPECIAL 4"
Command = ~D,DB,B,b
time = 15

[Command]
name = "SPECIAL 5"
Command = ~D,DF,F,c
time = 15

[Command]
name = "SPECIAL 6"
Command = ~D,DB,B,c
time = 15

[Command]
name = "SPECIAL 7"
Command = ~B,DB,D,DF,F,a
time = 30

[Command]
name = "SPECIAL 8"
Command = ~F,DF,D,DB,B,a
time = 30

[Command]
name = "SPECIAL 9"
Command = ~B,DB,D,DF,F,b
time = 30

[Command]
name = "SPECIAL 10"
Command = ~F,DF,D,DB,B,b
time = 30

[Command]
name = "SPECIAL 11"
Command = ~B,DB,D,DF,F,c
time = 30

[Command]
name = "SPECIAL 12"
Command = ~F,DF,D,DB,B,c
time = 30

[Defaults]

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
Command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
Command = B, B
time = 10
;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
Command = x+y
time = 1

[Command]
name = "recovery"
Command = y+z
time = 1

[Command]
name = "recovery"
Command = x+z
time = 1

[Command]
name = "recovery"
Command = a+b
time = 1

[Command]
name = "recovery"
Command = b+c
time = 1

[Command]
name = "recovery"
Command = a+c
time = 1
;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
Command = /$B,x
time = 1

[Command]
name = "back_y"
Command = /$B,y
time = 1

[Command]
name = "back_z"
Command = /$B,z
time = 1

[Command]
name = "down_x"
Command = /$D,x
time = 1

[Command]
name = "down_y"
Command = /$D,y
time = 1

[Command]
name = "down_z"
Command = /$D,z
time = 1

[Command]
name = "fwd_x"
Command = /$F,x
time = 1

[Command]
name = "fwd_y"
Command = /$F,y
time = 1

[Command]
name = "fwd_z"
Command = /$F,z
time = 1

[Command]
name = "up_x"
Command = /$U,x
time = 1

[Command]
name = "up_y"
Command = /$U,y
time = 1

[Command]
name = "up_z"
Command = /$U,z
time = 1

[Command]
name = "back_a"
Command = /$B,a
time = 1

[Command]
name = "back_b"
Command = /$B,b
time = 1

[Command]
name = "back_c"
Command = /$B,c
time = 1

[Command]
name = "down_a"
Command = /$D,a
time = 1

[Command]
name = "down_b"
Command = /$D,b
time = 1

[Command]
name = "down_c"
Command = /$D,c
time = 1

[Command]
name = "fwd_a"
Command = /$F,a
time = 1

[Command]
name = "fwd_b"
Command = /$F,b
time = 1

[Command]
name = "fwd_c"
Command = /$F,c
time = 1

[Command]
name = "up_a"
Command = /$U,a
time = 1

[Command]
name = "up_b"
Command = /$U,b
time = 1

[Command]
name = "up_c"
Command = /$U,c
time = 1
;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
Command = a
time = 1

[Command]
name = "b"
Command = b
time = 1

[Command]
name = "c"
Command = c
time = 1

[Command]
name = "x"
Command = x
time = 1

[Command]
name = "y"
Command = y
time = 1

[Command]
name = "z"
Command = z
time = 1

[Command]
name = "s"
Command = s
time = 1
;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
Command = $F
time = 1

[Command]
name = "downfwd"
Command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
Command = $D
time = 1

[Command]
name = "downback"
Command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
Command = $B
time = 1

[Command]
name = "upback"
Command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
Command = $U
time = 1

[Command]
name = "upfwd"
Command = $UF
time = 1
;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
Command = /x
time = 1

[Command]
name = "hold_y"
Command = /y
time = 1

[Command]
name = "hold_z"
Command = /z
time = 1

[Command]
name = "hold_a"
Command = /a
time = 1

[Command]
name = "hold_b"
Command = /b
time = 1

[Command]
name = "hold_c"
Command = /c
time = 1

[Command]
name = "hold_s"
Command = /s
time = 1
;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
Command = /$F
time = 1

[Command]
name = "holddownfwd"
Command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
Command = /$D
time = 1

[Command]
name = "holddownback"
Command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
Command = /$B
time = 1

[Command]
name = "holdupback"
Command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
Command = /$U
time = 1

[Command]
name = "holdupfwd"
Command = /$UF
time = 1
;---------- Comandos de la Inteligencia Artificial-----------------
; Comandos activadores
[Command]
name = "AI Prueba"
Command = y+z ; con el botï¿½n A+B activamos la AI
time = 1

[Command]
name = "AI desactivado"
Command = b+c ; Con el boton B+C desactivamos la AI
time = 1
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------Basicos-----------------------------------------
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
TriggerALL = AiLevel = 0
triggerall = power >= 100
triggerall = Stateno != 60
triggerall = Stateno != 70
value = 60
trigger1 = Command = "FF"
trigger1 = StateType != A
trigger1 = Ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
TriggerALL = AiLevel = 0
triggerall = power >= 100
triggerall = Stateno != 60
triggerall = Stateno != 70
value = 70
trigger1 = Command = "BB"
trigger1 = StateType != A
trigger1 = Ctrl
;---------------------------------------------------------------------------
; Correr Adelante (Aire)
[State -1, Correr Adelante (Aire)]
type = ChangeState
TriggerALL = var(2) > 0
triggerall = power >= 100
TriggerALL = AiLevel = 0
triggerall = Stateno != 62
triggerall = Stateno != 72
value = 62
triggerall = Command = "holdfwd"
triggerall = Command = "s"
trigger1 = StateType = A
trigger1 = Ctrl
;---------------------------------------------------------------------------
; Correr Atras (Aire)
[State -1, Correr Atras (Aire)]
type = ChangeState
TriggerALL = var(2) > 0
triggerall = power >= 100
TriggerALL = AiLevel = 0
triggerall = Stateno != 62
triggerall = Stateno != 72
value = 72
triggerall = Command = "holdback"
triggerall = Command = "s"
trigger1 = StateType = A
trigger1 = Ctrl
;---------------------------------------------------------------------------
; Air Dash Forward
[State -1, Air Dash Forward]
type = ChangeState
TriggerALL = AiLevel = 0
triggerall = power >= 100
triggerall = Stateno != 110
triggerall = Stateno != 115
value = 110
trigger1 = Command = "FF"
trigger1 = StateType = A
trigger1 = Ctrl
;---------------------------------------------------------------------------
; Air Dash Backwards
[State -1, Air Dash Backwards]
type = ChangeState
TriggerALL = AiLevel = 0
triggerall = power >= 100
triggerall = stateno != 110
triggerall = stateno != 115
value = 115
trigger1 = Command = "BB"
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
;Ultimate:
;===========================================================================
; Getsuga Tenshou Final
[State -1, Getsuga Tenshou Final]
Type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
Triggerall = power >= powermax
Value = 3000
Triggerall = Command = "z"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0

; Getsuga Tenshou Final (Aire)
[State -1, Getsuga Tenshou Final (Aire)]
Type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
Triggerall = power >= powermax
Value = 3004
Triggerall = Command = "z"
Triggerall = StateType = A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Bankai
;---------------------------------------------------------------------------
; Final Cut Bankai
[State -1, Final Cut Bankai]
Type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 1
Triggerall = power >= powermax
Value = 3100
Triggerall = Command = "z"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; HOS Shikai\Blood Chains
;---------------------------------------------------------------------------
; Getsuga Blood Chains
[State -1, Getsuga Blood Chains]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 4
Triggerall = power >= powermax
value = 3300
Triggerall = Command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(900) > 0
;---------------------------------------------------------------------------
; HOS Bankai
;---------------------------------------------------------------------------
; Final Getsuga Gran Rey Cero
[State -1, Final Getsuga Gran Rey Cero]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 2
Triggerall = power >= powermax
value = 3200
Triggerall = Command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(900) > 0
;===========================================================================
;SKILL:
;===========================================================================
; Getsuga Tenshou Base
[State -1, Getsuga Tenshou Base]
Type = ChangeState
triggerall = var(2) = 0
Triggerall = NumHelper(1045)=0
Triggerall = power >= 1000
Value = 1000
triggerall = command = "hold_s" && command = "a"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Counter
;[State -1, Counter]
;Type = ChangeState
;triggerall = var(2) = 0
;Triggerall = power >= 1000
;Value = 1100
;Triggerall = Command = "SPECIAL 2"
;Triggerall = StateType != A
;Trigger1 = Ctrl
;Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Ichigo Cutting Combo
[State -1, Ichigo Cutting Combo]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
value = 1300
triggerall = command = "hold_s" && command = "b"
Triggerall = StateType != A
trigger1 = ctrl
trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Double Getsuga 
[State -1,Double Getsuga]
Type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
Value = 1200
triggerall = command = "hold_s" && command = "c"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Getsuga Jujisho
[State -1, Getsuga Jujisho]
Type = ChangeState
Triggerall = var(2) = 0
Triggerall = NumHelper(1445)=0
Triggerall = power >= 2000
Value = 1400
triggerall = command = "hold_s" && command = "y"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Reiatsu Explosion
;[State -1, Reiatsu Explosion]
;Type = ChangeState
;triggerall = var(2) = 0
;Triggerall = power >= 1500
;Value = 1500
;Triggerall = Command = "SPECIAL 6"
;Triggerall = StateType != A
;Trigger1 = Ctrl
;Trigger2 = numhelper(7900) > 0
;===========================================================================
; Bankai
;===========================================================================
;SKILL:
;===========================================================================
;---------------------------------------------------------------------------
; La Espada Cut Combo
[State -1, La Espada Cut Combo]
Type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
Value = 21000
Triggerall = Command = "SPECIAL 1"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Counterattacking Quincy
[State -1, Counterattacking Quincy]
Type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
Value = 21100
Triggerall = Command = "SPECIAL 2"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Devastating Slash
[State -1,Devastating Slash]
Type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
Value = 21200
Triggerall = Command = "SPECIAL 3"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Raid
[State -1, Raid]
type = ChangeState
TriggerAll = var(2) = 1
Triggerall = power >= 1300
value = 21300
triggerall = command = "SPECIAL 4"
Triggerall = StateType != A
trigger1 = ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Maximum Reatsu release
[State -1, Maximum Reatsu release]
Type = ChangeState
Triggerall = var(2) = 1
Triggerall = power >= 1500
Value = 21400
Triggerall = Command = "SPECIAL 5"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;---------------------------------------------------------------------------
; Getsuga Tenshou Air
[State -1, Getsuga Tenshou Air]
Type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
Value = 21500
Triggerall = Command = "SPECIAL 6"
Triggerall = StateType != A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0

; Getsuga Tenshou (Aire)
[State -1, Getsuga Tenshou (Aire)]
Type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
Value = 21505
Triggerall = Command = "SPECIAL 6"
Triggerall = StateType = A
Trigger1 = Ctrl
Trigger2 = numhelper(7900) > 0
;===========================================================================
; HOS Shikai
;===========================================================================
;SPECIALS:
;===========================================================================
; Double Getsuga 
[State -1,Double Getsuga]
type = ChangeState
triggerall = var(2) = 4
Triggerall = power >= 1000
Value = 31000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Getsuga Combination
[State -1,Getsuga Combination]
type = ChangeState
triggerall = var(2) = 4
Triggerall = power >= 1500
Value = 31200
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Gran Rey Cero
[State -1,Gran Rey Cero]
type = ChangeState
triggerall = var(2) = 4
Triggerall = power >= 1500
value = 31400
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Getsuga Gran Rey Cero
[State -1, Getsuga Gran Rey Cero]
type = ChangeState
Triggerall = power >= 2000
triggerall = var(2) = 4
value = 31500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;===========================================================================
; HOS Bankai
;===========================================================================
;SKILL:
;===========================================================================
; Reatsu Advance
[State -1, Reatsu Advance]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1000
Value = 27000
Triggerall = command = "SPECIAL 1"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Reatsu Explosion 
[State -1, Reatsu Explosion]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1500
value = 27100
triggerall = command = "SPECIAL 2"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Spiritual Pressure
[State -1, Spiritual Pressure]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1000
value = 27200
triggerall = command = "SPECIAL 3"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Orihime's protection
[State -1, Orihime's protection]
type = ChangeState
triggerall = var(2) = 2
Triggerall = numhelper(27360) = 0
Triggerall = power >= 1000
Value = 27300
Triggerall = command = "SPECIAL 4"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Gran Rey Cero
[State -1, Gran Rey Cero]
type = ChangeState
triggerall = var(2) = 2
Triggerall = power >= 1500
value = 27400
triggerall = command = "SPECIAL 5"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;---------------------------------------------------------------------------
; Manifestation of the fused Zangetsu
[State -1, Manifestation of the fused Zangetsu]
type = ChangeState
Triggerall = power >= 1500
triggerall = var(2) = 2
Triggerall = numhelper(27501) = 0
value = 27500
triggerall = command = "SPECIAL 6"
Triggerall = statetype != A
Trigger1 = ctrl
Trigger2 = NumHelper(900) > 0
;===========================================================================
;-------------------------------ALL Forms-----------------------------------
;---------------------------------------------------------------------------
; Bankai
;[State -1, Bankai]
;type = ChangeState
;triggerall = power >= 1000
;triggerall = var(2) = 0
;triggerall = var(3) = 0
;value = 800
;triggerall = command = "x"
;Triggerall = statetype != A
;trigger1 = ctrl

; Bankai Cancelar
[State -1, Bankai Cancelar]
type = ChangeState
triggerall = var(2) = 1
value = 805
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; HOS Shikai
[State -1,HOS Shikai]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
Triggerall = var(3) = 0
value = 814
triggerall = Command = "x"
Triggerall = statetype != A
trigger1 = ctrl

; HOS Shikai Cancelar
[State -1, HOS Shikai Cancelar]
type = ChangeState
triggerall = var(2) = 4
value = 15805
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; HOS Shikai - Transform HOS Bankai
;[State -1, HOS Shikai - Transform HOS Bankai]
;type = ChangeState
;triggerall = power >= 2000
;triggerall = var(2) = 4
;value = 15800
;triggerall = command = "x"
;Triggerall = statetype != A
;trigger1 = ctrl
;---------------------------------------------------------------------------
; Bankai - Transform HOS Bankai
;[State -1, HOS Bankai]
;type = ChangeState
;triggerall = power >= 2000
;triggerall = var(2) = 1
;value = 2800
;triggerall = command = "x"
;Triggerall = statetype != A
;trigger1 = ctrl
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; Counter
[State -1, A + B]
Type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 500
Value = 290
Triggerall = Command = "s"
Triggerall = Command = "holddown"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + A
[State -1, Down + A]
Type = ChangeState
Value = 280
triggerall = var(2) = 0
Triggerall = Command = "a" && Command = "b"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; A
[State -1, A]
Type = ChangeState
Value = 200
triggerall = var(2) = 0
Triggerall = Command = "a"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + B
[State -1, Down + B]
Type = ChangeState
Value = 380
triggerall = var(2) = 0
Triggerall = Command = "b"
Triggerall = command = "holddown"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
Type = ChangeState
Value = 300
triggerall = var(2) = 0
Triggerall = Command = "b"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + C
[State -1,Down + C]
type=ChangeState
value = 450
triggerall = var(2) = 0
triggerall = power >= 200
triggerall = Command = "c"
triggerall = Command = "holddown"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
Type = ChangeState
Value = 400
triggerall = numhelper(9001) = 0
Triggerall = power >= 250
triggerall = var(2) = 0
Triggerall = NumHelper(445)=0
Triggerall = Command = "c"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + A Aire
[State -1, Down + A Aire]
Type = ChangeState
Value = 605
triggerall = var(2) = 0
Triggerall = Command = "a"
Triggerall = command = "holddown"
Triggerall = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
Type = ChangeState
Value = 600
triggerall = var(2) = 0
Triggerall = Command = "a"
Triggerall = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
Type = ChangeState
Value = 610
triggerall = var(2) = 0
Triggerall = Command = "b"
Triggerall = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + C Aire
[State -1,Down + C Aire]
type=ChangeState
value = 650
triggerall = var(2) = 0
triggerall = power >= 200
triggerall = Command = "c"
triggerall = Command = "holddown"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
Type = ChangeState
Value = 620
triggerall = numhelper(9001) = 0
TriggerAll = var(2) = 0
triggerall = power >= 250
Triggerall = NumHelper(625)=0
Triggerall = Command = "c"
Triggerall = StateType = A
Trigger1 = Ctrl
;===========================================================================
; Bankai
;===========================================================================
;---------------------------------------------------------------------------
; Down + A
[State -1, Down + A]
Type = ChangeState
triggerall = var(2) = 1
Value = 2280
Triggerall = Command = "a"
Triggerall = Command = "holddown"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; A
[State -1, A]
Type = ChangeState
triggerall = var(2) = 1
Value = 2200
Triggerall = Command = "a"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; Down + B
[State -1, Down + B]
Type = ChangeState
triggerall = var(2) = 1
Triggerall=power>=250
Value = 2380
Triggerall = Command = "b"
Triggerall = command = "holddown"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
Type = ChangeState
triggerall = var(2) = 1
Value = 2300
Triggerall = Command = "b"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
Type = ChangeState
Value = 2400
triggerall = var(2) = 1
Triggerall = power >= 500
Triggerall = Command = "c"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
Type = ChangeState
triggerall = var(2) = 1
Value = 2600
Triggerall = Command = "a"
Triggerall = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
Type = ChangeState
triggerall = var(2) = 1
Value = 2610
Triggerall = Command = "b"
Triggerall = StateType = A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
Type = ChangeState
triggerall = var(2) = 1
triggerall = power >= 250
Value = 2620
Triggerall = Command = "c"
Triggerall = StateType = A
Trigger1 = Ctrl
;===========================================================================
; HOS Shikai
;---------------------------------------------------------------------------
; Down + A
[State -1, Down + A]
type = ChangeState
triggerall = var(2) = 4
value = 15280
triggerall = Command = "holddown"
triggerall = Command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
triggerall = var(2) = 4
value = 15200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
triggerall = var(2) = 4
value = 15300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
Type = ChangeState
triggerall = var(2) = 4
Value = 15400
Triggerall = power >= 250
triggerall = numhelper(9001) = 0
Triggerall = NumHelper(15445)=0
Triggerall = Command = "c"
Triggerall = StateType != A
Trigger1 = Ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
triggerall = var(2) = 4
value = 15600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
triggerall = var(2) = 4
value = 15610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
triggerall = var(2) = 4
triggerall = numhelper(9001) = 0
triggerall = power >= 400
value = 15620
triggerall = Command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;===========================================================================
; HOS Bankai
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
triggerall = var(2) = 2
value = 11200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
triggerall = var(2) = 2
value = 11300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = var(2) = 2
triggerall = power >= 400
value = 11400
triggerall = Command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
triggerall = var(2) = 2
value = 11600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
triggerall = var(2) = 2
value = 11610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, Down + C Aire]
type = ChangeState
triggerall = var(2) = 2
triggerall = power >= 400
value = 11620
triggerall = Command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;===========================================================================
; CODING FOR ALL VAR	
;===========================================================================
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
triggerall = var(2) = 0 || var(2) = 1|| var(2) = 4 
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command != "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge - HOS Bankai
[State -1, Power Charge - HOS Bankai]
type = ChangeState
triggerall = var(2) = 2 
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 11500
triggerall = command != "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl