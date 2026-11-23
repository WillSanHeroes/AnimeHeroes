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
;---------------------------------------------------------------------------
[Statedef -1]
;===========================================================================
;---------------------------Basicos-----------------------------------------
;---------------------------------------------------------------------------
; Correr Adelante
[State -1, Correr Adelante]
type = ChangeState
Triggerall = var(2) = 0
triggerall = var(5) = 0
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = ifelse(pos y >= 0,ifelse(var (3) = 1,2080,60),ifelse(var (3) = 1,2080,65))
trigger1 = command = "FF"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras
[State -1, Correr Atras]
type = ChangeState
Triggerall = var(2) = 0
triggerall = var(5) = 0
triggerall = stateno != 60
triggerall = stateno != 65
triggerall = stateno != 70
value = ifelse(var (3) = 1,2090,70)
trigger1 = command = "BB"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Adelante DF
[State -1, Correr Adelante DF]
type = ChangeState
triggerall = var(2) = 1
triggerall = stateno != 2060
triggerall = stateno != 2070
value = 2060
trigger1 = command = "FF"
trigger1 = ctrl
;---------------------------------------------------------------------------
; Correr Atras DF
[State -1, Correr Atras DF]
type = ChangeState
triggerall = var(2) = 1
triggerall = stateno != 2060
triggerall = stateno != 2070
value = 2070
trigger1 = command = "BB"
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
;SUPERS:
;===========================================================================
; Metsuryuu Ougi: Guren Bakuenjin
[State -1, Metsuryuu Ougi: Guren Bakuenjin]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3000
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Raienryuu no Hoko
[State -1, Raienryuu no Hoko]
type = ChangeState
Triggerall = var(3) = 1
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 21800
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Cho Enryu no Hoko
[State -1, Cho Enryu no Hoko]
type = ChangeState
Triggerall = var(3) = 2
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 23100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shiranui Gata: Guren Hoo Ken
[State -1, Shiranui Gata: Guren Hoo Ken]
type = ChangeState
Triggerall = var(2) = 1
triggerall = var(41) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SKILLS: BASE
;===========================================================================
; Karyu no Yokugeki
[State -1, Karyu no Yokugeki]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
Triggerall = power >= 1000
value = 1000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Karyu no Koen
[State -1, Karyu no Koen]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
Triggerall = power >= 1000
value = 1180
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype = A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Karyu no Kagitsume
[State -1, Karyu no Kagitsume]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
Triggerall = power >= 1500
value = 1300
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Karyu no Kenkaku
[State -1, Karyu no Kenkaku]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
Triggerall = power >= 1500
value = 1200
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Guren Karyuken
[State -1, Guren Karyuken]
type = ChangeState
Triggerall = var(2) = 0
Triggerall = var(3) = 0
Triggerall = power >= 2000
value = 1500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Karyu no Hoko
[State -1, Karyu no Hoko]
type = ChangeState
Triggerall = var(2) < 2
Triggerall = var(3) = 0
Triggerall = power >= 500
value = 1400
triggerall = command = "c"
triggerall = command = "holddown"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SKILLS: MODO RAIENRYU
;===========================================================================
; Raienryu no Koen
[State -1, Raienryu no Koen]
type = ChangeState
Triggerall = var(3) = 1
Triggerall = power >= 1000
value = ifelse(pos y < 0,21180,21100)
triggerall = command = "hold_s" && command = "a"
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Raienryu no Kagitsume
[State -1, Raienryu no Kagitsume]
type = ChangeState
Triggerall = var(3) = 1
Triggerall = power >= 1500
value = 21600
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Raienryu no Kagitsume
[State -1, Raienryu no Kagitsume]
type = ChangeState
Triggerall = var(3) = 1
Triggerall = power >= 1500
value = 1700
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Raienryu Explosion
[State -1, Raienryu Explosion]
type = ChangeState
triggerall = var(3) = 1
Triggerall = power >= 2000
value = 21700
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SKILLS: DRAGONFORCE
;===========================================================================
; Karyu no Kick
[State -1, Karyu no Kick]
type = ChangeState
Triggerall = var(2) = 1
Triggerall = power >= 1000
value = 30000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Ryu Ken
[State -1, Ryu Ken]
type = ChangeState
Triggerall = var(2) = 1
Triggerall = power >= 1500
value = 30500
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Dragon Presence
[State -1, Dragon Presence]
type = ChangeState
Triggerall = var(2) = 1
Triggerall = power >= 1500
value = 30300
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Guren Bakuenjin
[State -1, Guren Bakuenjin]
type = ChangeState
Triggerall = var(2) = 1
Triggerall = power >= 1500
value = 30200
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Furious Discharge
[State -1, Furious Discharge]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
value = 22000
triggerall = command = "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

;===========================================================================
;AWAKE TRANSFORMS
;===========================================================================
; Raienryu Cancelar
[State -1, Raienryu Cancelar]
type = ChangeState
triggerall = var(3) = 1
value = 1605
triggerall = command = "holddown"
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Modo Raienryu
[State -1, Modo Raienryu]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
triggerall = var(3) = 0
value = 1600
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Dragon Force
[State -1, Dragon Force]
type = ChangeState
triggerall = numhelper(9996) < 1
triggerall = var(41) = 1
triggerall = var(2) = 0
triggerall = var(3) = 1
value = 900
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0

;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; Down A
[State -1, Down A]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(3) = 0
value = 21910
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Down A
[State -1, Down A]
type = ChangeState
triggerall = var(3) = 1
value = 21911
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Down A
[State -1, Down A]
type = ChangeState
triggerall = var(2) = 1
value = 21913
triggerall = command = "holddown"
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Down B
[State -1, Down B]
type = ChangeState
triggerall = var(2) = 0
triggerall = var(3) = 0
value = 21920
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Down B
[State -1, Down B]
type = ChangeState
triggerall = var(3) = 1
value = 21921
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Down B
[State -1, Down B]
type = ChangeState
triggerall = var(2) = 1
value = 21923
triggerall = command = "holddown"
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; A
[State -1, A]
type = ChangeState
Triggerall = var(2) < 2
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B
[State -1, B]
type = ChangeState
Triggerall = var(2) = 0
value = 300
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B DF
[State -1, B DF]
type = ChangeState
Triggerall = var(2) = 1
value = 210
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C
[State -1, C]
type = ChangeState
triggerall = power >= 150
Triggerall = var(2) < 2
value = 400
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
Trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
Triggerall = var(2) < 2
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
Triggerall = var(2) < 2
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
Triggerall = var(2) = 0
value = 620
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire DF
[State -1, C Aire DF]
type = ChangeState
Triggerall = var(2) = 1
value = 2620
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
