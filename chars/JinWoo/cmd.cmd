 ;-| Specials |-------------------------------------------------------
[command]

[command]
name = "skill_7"
command = /$D, a
time = 50
[command]
name = "skill_8"
command = /$D, b
time = 50
[command]
name = "b+c"
command = b+c
time = 15
[command]
name = "a+b"
command = a+b
time = 15
[command]
name = "FF"
command = F, F
time = 10
[command]
name = "BB"
command = B, B
time = 10
[command]
name = "recovery"
command = x+y
time = 1
[command]
name = "recovery"
command = y+z
time = 1
[command]
name = "recovery"
command = x+z
time = 1
[command]
name = "recovery"
command = a+b
time = 1
[command]
name = "recovery"
command = b+c
time = 1
[command]
name = "recovery"
command = a+c
time = 1
[command]
name = "back_x"
command = /$B, x
time = 1
[command]
name = "back_y"
command = /$B, y
time = 1
[command]
name = "back_z"
command = /$B, z
time = 1
[command]
name = "down_x"
command = /$D, x
time = 1
[command]
name = "down_y"
command = /$D, y
time = 1
[command]
name = "down_z"
command = /$D, z
time = 1
[command]
name = "fwd_x"
command = /$F, x
time = 1
[command]
name = "fwd_y"
command = /$F, y
time = 1
[command]
name = "fwd_z"
command = /$F, z
time = 1
[command]
name = "up_x"
command = /$U, x
time = 1
[command]
name = "up_y"
command = /$U, y
time = 1
[command]
name = "up_z"
command = /$U, z
time = 1
[command]
name = "back_a"
command = /$B, a
time = 1
[command]
name = "back_b"
command = /$B, b
time = 1
[command]
name = "back_c"
command = /$B, c
time = 1
[command]
name = "down_a"
command = /$D, a
time = 1
[command]
name = "down_b"
command = /$D, b
time = 1
[command]
name = "down_c"
command = /$D, c
time = 1
[command]
name = "fwd_a"
command = /$F, a
time = 1
[command]
name = "fwd_b"
command = /$F, b
time = 1
[command]
name = "fwd_c"
command = /$F, c
time = 1
[command]
name = "up_a"
command = /$U, a
time = 1
[command]
name = "up_b"
command = /$U, b
time = 1
[command]
name = "up_c"
command = /$U, c
time = 1
[command]
name = "a"
command = a
time = 1
[command]
name = "b"
command = b
time = 1
[command]
name = "c"
command = c
time = 1
[command]
name = "x"
command = x
time = 1
[command]
name = "y"
command = y
time = 1
[command]
name = "z"
command = z
time = 1
[command]
name = "s"
command = s
time = 1
[command]
name = "fwd"
command = $F
time = 1
[command]
name = "downfwd"
command = $DF
time = 1
[command]
name = "down"
command = $D
time = 1
[command]
name = "downback"
command = $DB
time = 1
[command]
name = "back"
command = $B
time = 1
[command]
name = "upback"
command = $UB
time = 1
[command]
name = "up"
command = $U
time = 1
[command]
name = "upfwd"
command = $UF
time = 1
[command]
name = "hold_x"
command = /x
time = 1
[command]
name = "hold_y"
command = /y
time = 1
[command]
name = "hold_z"
command = /z
time = 1
[command]
name = "hold_a"
command = /a
time = 1
[command]
name = "hold_b"
command = /b
time = 1
[command]
name = "hold_c"
command = /c
time = 1
[command]
name = "hold_s"
command = /s
time = 1
[command]
name = "holdfwd"
command = /$F
time = 1
[command]
name = "holddownfwd"
command = /$DF
time = 1
[command]
name = "holddown"
command = /$D
time = 1
[command]
name = "holddownback"
command = /$DB
time = 1
[command]
name = "holdback"
command = /$B
time = 1
[command]
name = "holdupback"
command = /$UB
time = 1
[command]
name = "holdup"
command = /$U
time = 1
[command]
name = "holdupfwd"
command = /$UF
time = 1

[statedef -1]

;Counter Dodge
[State 0]
type = ChangeState
triggerall = statetype != A
triggerall = (roundstate = 2) && (ctrl) && (pos y = 0)
trigger1 = (!ailevel) && ((command = "holddown") && (command = "s"))
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
value = 1900

[State 0]
type = ChangeState
triggerall = stateno != 70
triggerall = command = "FF"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = ifelse(statetype = A,70,60)

[State 0]
type = ChangeState
triggerall = stateno != 75
triggerall = command = "BB"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,65]
value = ifelse(statetype = A,75,65)

[State 0]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
triggerall = command = "s"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,65]
Triggerall = statetype != A
value = 500

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
value = cond(command = "holdback" && pos y >= 0, 6107, cond(command = "holdfwd" && pos y >= 0, 6106, 6105))

[State 0]
type = ChangeState
triggerall = teammode != simul
triggerall = var(41) = 1
triggerall = statetype != A
triggerall = command = "z"
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = ifelse(var(3) = 1,3100,3000)

; Monarc Domain
[State 0]
type = ChangeState
triggerall = var(3) = 0
triggerall = var(41) = 1
triggerall = command = "x"
triggerall = !ailevel
Triggerall = statetype != A
trigger1 = ctrl
value = 2600
;value = ifelse(var(3)=1,2620,2600)

;Speed Slash
[State 0]
type = ChangeState
triggerall = var(3) = 0
triggerall = command = "hold_s" && command = "a"
triggerall = statetype != A
triggerall = ailevel = 0
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = [60,65]
value = 1000

;Shadowblade Storm
[State 0]
type = ChangeState
triggerall = var(3) = 1
triggerall = command = "hold_s" && command = "a"
triggerall = ailevel = 0
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = 1100

;Igris Protect
[State 0]
type = ChangeState
triggerall = numhelper(2298) = 0
triggerall = numhelper(2299) = 0
triggerall = statetype != A
triggerall = command = "hold_s" && command = "b"
triggerall = ailevel = 0
triggerall = power >= 1500
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = ifelse(var(3) = 1,1201,1260)

;Iron
[State 0]
type = ChangeState
triggerall = numhelper(1410) = 0
triggerall = numhelper(1411) = 0
triggerall = command = "hold_s" && command = "c"
triggerall = ailevel = 0
triggerall = power >= 1500
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = 1400

;Tusk
[State 0]
type = ChangeState
triggerall = numhelper(1510) = 0
triggerall = numhelper(1511) = 0
triggerall = statetype != A
triggerall = command = "hold_s" && command = "y"
triggerall = ailevel = 0
triggerall = power >= 2000
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = 1500

;[State 0]
;type = ChangeState
;triggerall = numhelper(2398) = 0
;triggerall = numhelper(2399) = 0
;triggerall = statetype != A
;triggerall = command = "SPECIAL 6" || command = "hold_s" && command = "c" && command = "holdback"
;triggerall = ailevel = 0
;triggerall = power >= 2000
;trigger1 = ctrl
;trigger2 = stateno = [60,75]
;value = 1300

;Ruler Authority
[State 0, Ruler Authority]
type = ChangeState
triggerall = var(3) = 0
triggerall = command = "holddown"
triggerall = command = "a"
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = [60,75]
value = ifelse(statetype = A,1640,1600)

;Bellion & Greed
[State 0]
type = ChangeState
triggerall = var(3) = 1
triggerall = numhelper(2010) = 0
triggerall = numhelper(2120) = 0
triggerall = statetype != A
triggerall = command = "holddown"
triggerall = command = "a"
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
value = 2000

[State 0]
type = ChangeState
triggerall = var(3) = 0
triggerall = statetype != A
triggerall = command = "holddown"
triggerall = command = "b"
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
value = 1700

[State 0]
type = ChangeState
triggerall = var(3) = 1
triggerall = command = "holddown"
triggerall = command = "b"
triggerall = ailevel = 0
triggerall = power >= 500
Triggerall = statetype != A
trigger1 = ctrl
value = 2700

;Arise minions
[State 0]
type = ChangeState
triggerall = numhelper(1810) = 0
triggerall = numhelper(1811) = 0
triggerall = statetype != A
triggerall = command = "holddown"
triggerall = command = "c"
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
value = 1800

;Retreat Igris azul
[State 0]
type = ChangeState
triggerall = var(3) <= 0
triggerall = numhelper(2210) = 1
triggerall = numhelper(2275) = 0
triggerall = command = "a+b"
trigger1 = ctrl
value = 2270
;Retreat Igris roxo
[State 0]
type = ChangeState
triggerall = var(3) <= 1
triggerall = numhelper(2211) = 1
triggerall = numhelper(2275) = 0
triggerall = command = "a+b"
trigger1 = ctrl
value = 2270

; Summon Igris
[State 0]
type = ChangeState
triggerall = numhelper(9002) = 0
triggerall = numhelper(2298) = 0 ;Igris
triggerall = numhelper(2299) = 0 ;Igris
triggerall = numhelper(2398) = 0 ;Beru
triggerall = numhelper(2399) = 0 ;Beru
triggerall = power >= 2000
triggerall = command = "a+b"
Triggerall = statetype != A
trigger1 = ctrl
value = 2200

;Retreat Beru azul
[State 0]
type = ChangeState
triggerall = var(3) <= 0
triggerall = numhelper(2310) = 1
triggerall = numhelper(2375) = 0
triggerall = command = "b+c"
trigger1 = ctrl
value = 2370
;Retreat Beru roxo
[State 0]
type = ChangeState
triggerall = var(3) <= 1
triggerall = numhelper(2311) = 1
triggerall = numhelper(2375) = 0
triggerall = command = "b+c"
trigger1 = ctrl
value = 2370

; Summon Beru
[State 0]
type = ChangeState
triggerall = numhelper(9002) = 0
triggerall = numhelper(2298) = 0 ;Igris
triggerall = numhelper(2299) = 0 ;Igris
triggerall = numhelper(2398) = 0 ;Beru
triggerall = numhelper(2399) = 0 ;Beru
triggerall = power >= 2000
triggerall = command = "b+c"
Triggerall = statetype != A
trigger1 = ctrl
value = 2201

[State 0]
type = ChangeState
triggerall = command = "skill_7"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
value = 270

[State 0]
type = ChangeState
triggerall = command = "a"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,65]
value = 200

[State 0]
type = ChangeState
triggerall = command = "b"
triggerall = statetype != A
triggerall = ailevel = 0
trigger1 = ctrl
trigger2 = stateno = [60,65]
value = 300

[State 0]
type = ChangeState
triggerall = !NumHelper(420)
triggerall = command = "c"
triggerall = statetype != A
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
trigger2 = stateno = [60,65]
value = 400

[State 0]
type = ChangeState
triggerall = command = "a"
triggerall = statetype = A
triggerall = ailevel = 0
trigger1 = ctrl
value = 600

[State 0]
type = ChangeState
triggerall = stateno != 340
triggerall = command = "b"
triggerall = statetype = A
triggerall = ailevel = 0
trigger1 = ctrl
value = 350

[State 0]
type = ChangeState
triggerall = command = "c"
triggerall = statetype = A
triggerall = ailevel = 0
triggerall = power >= 500
trigger1 = ctrl
value = 630