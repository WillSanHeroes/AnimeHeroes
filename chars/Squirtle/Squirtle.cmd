; The CMD file.

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

[command]
name = "721"
command = B,B
time = 15

[command]
name = "720"
command = F,F
time = 15

[Remap]
[command]
name = "350"
command = F,F,c
time = 15

[command]
name = "340"
command = F,F,b
time = 15

[command]
name = "330"
command = F,F,a
time = 15

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

;---------------------------------------------------------------------------
; 2. State entry
; --------------
[Command]
name = "Super Jump"
command = ~D,U
time = 10

[Command]
name = "StrikeA+B"
command = a+b
time = 30

[Command]
name = "StrikeA+C"
command = a+c
time = 30

[Command]
name = "StrikeB+C"
command = b+c
time = 30

[Statedef -1]
; Blastoise - escolha, igual aos outros despertares
[State -1, Blastoise]
type = ChangeState
triggerall = roundstate = 2
triggerall = var(41) = 1
triggerall = var(42) = 0
triggerall = !ailevel
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
value = 19800
;===========================================================================
;---------------------------Basicos-----------------------------------------
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
triggerall = var(42) = 1
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = numexplod(99999) = 0
triggerall = stateno != 70
value = ifelse(pos y >= 0,60,65)
trigger1 = command = "FF"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
triggerall = var(42) = 1
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
triggerall = numexplod(99999) = 0
value = ifelse(pos y >= 0,70,66)
trigger1 = command = "BB"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Super Jump
[State -1, Super Jump]
type = ChangeState
triggerall = var(42) = 1
value = 80
trigger1 = command = "Super Jump"
trigger1 = statetype = S
trigger1 = ctrl
;===========================================================================
;Ultimate:
;===========================================================================
;---------------------------------------------------------------------------
; Mega Hydro Cannon
[State -1, Mega Hydro Cannon]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 3000
TRIGGERALL = teammode != simul
value = 3000
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "hold_s"
Triggerall = statetype != A
trigger1 = ctrl
;===========================================================================
;SUPERS:
;===========================================================================
; Water Spout
[State -1, Water Spout]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 1500
value = 2200
triggerall = command = "hold_s"
triggerall = command = "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Surf
[State -1, Surf]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 2000
value = 2000
triggerall = command = "hold_s"
triggerall = command = "y"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shell Smash
[State -1, Shell Smash]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 1000
triggerall = !numexplod(1650)
triggerall = var(3) = 0
triggerall = var(25) = 0
value = 201600
triggerall = command = "holddown"
triggerall = command = "z"
triggerall = command != "hold_s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Withdraw
[State -1, Withdraw]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 0
triggerall = var(3) = 0
Triggerall = power >= 500
value = 1700
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = command != "hold_s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Air Withdraw
[State -1, Air Withdraw]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 500
value = 1720
triggerall = command = "y"
triggerall = command != "hold_s"
Triggerall = statetype = A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SPECIALS:
;===========================================================================
; Ice Beam
[State -1, Ice Beam]
type = ChangeState
triggerall = var(42) = 1
triggerall = numhelper(1370) = 0
Triggerall = power >= 1000
value = 201300
triggerall = command = "hold_s"
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Whirlpool
[State -1, Whirlpool]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 1500
value = 1500
triggerall = command = "hold_s"
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Scald
[State -1, Scald]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 1000
value = 1000
triggerall = command = "hold_s"
triggerall = command = "a"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Aqua Ring
[State -1, Aqua Ring]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 0
triggerall = var(3) = 0
Triggerall = power >= 1000
value = 1100
triggerall = command = "holddown"
triggerall = command = "s"
triggerall = command != "hold_a"
triggerall = command != "hold_b"
triggerall = command != "hold_c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Dark Pulse
[State -1, Dark Pulse]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 1
Triggerall = power >= 1000
value = 1800
triggerall = command = "holddown"
triggerall = command = "s"
triggerall = command != "hold_a"
triggerall = command != "hold_b"
triggerall = command != "hold_c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Aqua Jet
[State -1, Aqua Jet]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 1
Triggerall = power >= 1000
value = 1900
triggerall = command = "hold_s"
triggerall = command = "b"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Skull Bash
[State -1, Skull Bash]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 0
Triggerall = power >= 1000
value = 201200
triggerall = command = "hold_s"
triggerall = command = "b"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Skull Bash - Air
[State -1, Skull Bash - Air]
type = ChangeState
triggerall = var(42) = 1
triggerall = var(25) = 0
Triggerall = power >= 1000
value = 1205
triggerall = command = "hold_s"
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Hydro Pump
[State -1, Hydro Pump]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 1500
value = 1400
triggerall = command = "hold_s"
triggerall = command = "c"
triggerall = command != "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
; Body Slam
[State -1, Body Slam]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 500
value = 280
triggerall = command = "StrikeA+B"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Dive
[State -1, Dive]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 500
value = 380
triggerall = command = "StrikeA+C"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Flash Canon
[State -1, Flash Canon]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power >= 500
value = 480
triggerall = command = "StrikeB+C"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Rapid Spin
[State -1, Rapid Spin]
type = ChangeState
triggerall = var(42) = 1
value = 200250
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
triggerall = var(42) = 1
value = 200
triggerall = command != "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Bubble
[State -1, Bubble]
type = ChangeState
triggerall = var(42) = 1
value = 200350
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------; B
[State -1, B]
type = ChangeState
triggerall = var(42) = 1
value = 300
triggerall = command != "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Water Pulse
[State -1, Water Pulse]
type = ChangeState
triggerall = var(42) = 1
value = 200440
triggerall = command = "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = var(42) = 1
value = 400
triggerall = command != "holddown"
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
triggerall = var(42) = 1
Triggerall = power < 3000
value = 500
triggerall = command = "s"
Trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A / B Aire
[State -1, A / B Aire]
type = ChangeState
triggerall = var(42) = 1
value = 281
triggerall = command = "holddown"
triggerall = command = "a" 
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A / B Aire
[State -1, A / B Aire]
type = ChangeState
triggerall = var(42) = 1
value = 615
triggerall = command = "holddown"
triggerall = command = "b" 
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A / B Aire
[State -1, A / B Aire]
type = ChangeState
triggerall = var(42) = 1
value = 600
triggerall = command != "holddown"
triggerall = command = "a" 
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A / B Aire
[State -1, A / B Aire]
type = ChangeState
triggerall = var(42) = 1
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
triggerall = var(42) = 1
value = 620
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl

;721
[State -1, 721]
type = ChangeState
triggerall = var(42) = 0
value = 721
triggerall = command = "721"
trigger1 = (statetype = a) && ctrl

;720
[State -1, 720]
type = ChangeState
triggerall = var(42) = 0
value = 720
triggerall = command = "720"
trigger1 = (statetype = a) && ctrl

;Break Attack
;[State -1,930]
;type = ChangeState
;triggerall = power>500
;value = 930
;triggerall = command = "a"
;trigger1 = Movetype = H
;triggerall = stateno = 152

;[State -1,930]
;type = ChangeState
;triggerall = power>500
;value = 930
;triggerall = command = "a"
;trigger1 = Movetype = H
;triggerall = stateno = 150

;350
[State -1, 350]
type = ChangeState
triggerall = var(42) = 0
value = 350
triggerall = command = "350"
trigger1 = (statetype = s) && ctrl

;340
[State -1, 340]
type = ChangeState
triggerall = var(42) = 0
value = 340
triggerall = command = "340"
trigger1 = (statetype = s) && ctrl

;330
[State -1, 330]
type = ChangeState
triggerall = var(42) = 0
value = 330
triggerall = command = "330"
trigger1 = (statetype = s) && ctrl

;========================PARRY=SYSTEM======================================
[state > parry]
type = changestate
triggerall = var(42) = 0
triggerall = (roundstate = 2) && (ctrl) && (!numhelper(80015))
trigger1 = ((!ailevel) && (command != "hold_s") && ((command = "holddown") && (command = "y")))
value = 99600
ignorehitpause = 1
[state > dodge]
type = changestate
triggerall = var(42) = 0
triggerall = (roundstate = 2) && (!numexplod(105)) && ((ctrl) || (stateno = 6100))
trigger1 = (!ailevel) && (command != "hold_s") && (command != "holddown") && (command = "y")
value = cond(command = "holdback" && pos y >= 0, 6107, cond(command = "holdfwd" && pos y >= 0, 6106, 6105))
;---------------------------------------------------------------------------

;Whirlpool
[State -1, Whirlpool]
type = ChangeState
triggerall = var(42) = 0
value = 6030
triggerall = var(41) = 1
triggerall = teammode != simul
triggerall = command = "z"
triggerall = power >= powermax
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 231 && movecontact
trigger4 = stateno = 232 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 241 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 251 && movecontact
trigger9 = stateno = 330 && movecontact
trigger10 = stateno = 340 && movecontact
trigger11 = stateno = 430 && movecontact

;Rapid Spin
[State -1, Rapid Spin]
type = ChangeState
triggerall = var(42) = 0
value = 6000
triggerall = power >= 1000
triggerall = command = "hold_s" && command = "a"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 231 && movecontact
trigger4 = stateno = 232 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 241 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 251 && movecontact
trigger9 = stateno = 330 && movecontact
trigger10 = stateno = 340 && movecontact
trigger11 = stateno = 430 && movecontact

;Rapid Spin + Water Gun
[State -1, Rapid Spin + Water Gun]
type = ChangeState
triggerall = var(42) = 0
value = 6015
triggerall = power >= 1500
triggerall = command = "hold_s" && command = "b"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 231 && movecontact
trigger4 = stateno = 232 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 241 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 251 && movecontact
trigger9 = stateno = 330 && movecontact
trigger10 = stateno = 340 && movecontact
trigger11 = stateno = 430 && movecontact
;Rapid Spin + Water Gun
[State -1, Rapid Spin + Water Gun]
type = ChangeState
triggerall = var(42) = 0
value = 6040
triggerall = power >= 1500
triggerall = command = "hold_s" && command = "b"
trigger1 = (statetype = a) && ctrl

;Water Gun
[State -1, Water Gun]
type = ChangeState
triggerall = var(42) = 0
value = 6020
triggerall = power >= 1500
triggerall = command = "hold_s" && command = "c"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 231 && movecontact
trigger4 = stateno = 232 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 241 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 251 && movecontact
trigger9 = stateno = 330 && movecontact
trigger10 = stateno = 340 && movecontact
trigger11 = stateno = 430 && movecontact

;Surf
[State -1, Surf]
type = ChangeState
triggerall = var(42) = 0
value = 6025
triggerall = power >= 2000
triggerall = command = "hold_s" && command = "y"
trigger1 = (statetype = s) && ctrl
trigger2 = stateno = 230 && movecontact
trigger3 = stateno = 231 && movecontact
trigger4 = stateno = 232 && movecontact
trigger5 = stateno = 240 && movecontact
trigger6 = stateno = 241 && movecontact
trigger7 = stateno = 250 && movecontact
trigger8 = stateno = 251 && movecontact
trigger9 = stateno = 330 && movecontact
trigger10 = stateno = 340 && movecontact
trigger11 = stateno = 430 && movecontact
;Surf AIR
[State -1, Surf AIR]
type = ChangeState
triggerall = var(42) = 0
value = 6045
triggerall = command = "hold_s" && command = "y"
triggerall = power >= 2000
trigger1 = (statetype = a) && ctrl

;Bubble Beam
;[State -1, 6010]
;type = ChangeState
;value = 6010
;triggerall = command = "SPECIAL 3" || command = "hold_s" && command = "b" && command = "holdfwd"
;triggerall = power >= 1500
;trigger1 = (statetype = s) && ctrl
;trigger2 = stateno = 230 && movecontact
;trigger3 = stateno = 231 && movecontact
;trigger4 = stateno = 232 && movecontact
;trigger5 = stateno = 240 && movecontact
;trigger6 = stateno = 241 && movecontact
;trigger7 = stateno = 250 && movecontact
;trigger8 = stateno = 251 && movecontact
;trigger9 = stateno = 330 && movecontact
;trigger10 = stateno = 340 && movecontact
;trigger11 = stateno = 430 && movecontact
;===========================================================================
;---------------------------------------------------------------------------

;===========================================================================
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
triggerall = var(42) = 0
value = 100
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
triggerall = var(42) = 0
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl



;===========================================================================
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
triggerall = var(42) = 0
value = 195
Triggerall = var(41)=0 || var(41)=1 && power<powermax
triggerall = command = "hold_s"
triggerall = command = "hold_s"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
triggerall = var(42) = 0
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;----------------------------------------------------------------------------
[State -1, 231]
type = ChangeState
triggerall = var(42) = 0
value = 231
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 230&&movehit
;---------------------------------------­------------------------------------
[State -1, 232]
type = ChangeState
triggerall = var(42) = 0
value = 232
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 231&&movehit
;---------------------------------------­------------------------------------
[State -1, 233]
type = ChangeState
triggerall = var(42) = 0
value = 233
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 232&&movehit
;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
triggerall = var(42) = 0
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;----------------------------------------------------------------------------
[State -1, 241]
type = ChangeState
triggerall = var(42) = 0
value = 241
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 240&&movehit
;---------------------------------------------------------------------------
; Standing Strong Kick
[State -1, Standing Strong Kick]
type = ChangeState
triggerall = var(42) = 0
value = 250
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;----------------------------------------------------------------------------
[State -1, 251]
type = ChangeState
triggerall = var(42) = 0
value = 251
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250&&movehit
;----------------------------------------------------------------------------
[State -1, 252]
type = ChangeState
triggerall = var(42) = 0
value = 252
triggerall = command = "c"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 251&&movehit
;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
triggerall = var(42) = 0
value = 6005;430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
triggerall = var(42) = 0
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Strong Kick
[State -1, Crouching Strong Kick]
type = ChangeState
triggerall = var(42) = 0
value = 450
triggerall = command = "c"
triggerall = power >= 100
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
triggerall = var(42) = 0
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
;----------------------------------------------------------------------------
[State -1, 631]
type = ChangeState
triggerall = var(42) = 0
value = 631
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 630&&movehit
;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
triggerall = var(42) = 0
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
triggerall = var(42) = 0
value = 650
triggerall = command = "c"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
