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
;ULTIMATE:
;===========================================================================
; Cho Oodama Rasengan
[State -1, Cho Oodama Rasengan]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 0
Triggerall = power >= powermax
value = 1399
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Shiki Fuujin
[State -1, Shiki Fuujin]
type = ChangeState
triggerall = var(41) = 1
triggerall = var(2) = 1
triggerall = teammode != simul
Triggerall = power >= powermax
value = 3100
triggerall = command = "z"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SKILLS:
;===========================================================================
; Rasengan
[State -1, Rasengan]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1000
value = 1000
triggerall = command = "hold_s" && command = "a"
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Hiraishin no Jutsu LV2
[State -1, Hiraishin no Jutsu LV2]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
value = ifelse(numhelper(1150),1301,1300)
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Hiraishin Dance
[State -1, Hiraishin Dance]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 1500
value = 1200
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
;Kcm
;---------------------------------------------------------------------------
; Oodama Rasengan
[State -1, Oodama Rasengan]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
value = 30000
triggerall = command = "hold_s" && command = "a"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Cho Mini Bijuudama
[State -1, Cho Mini Bijuudama]
type = ChangeState
triggerall = var(2) = 1
triggerall = numhelper(30150) = 0
Triggerall = power >= 1500
value = 30100
triggerall = command = "hold_s" && command = "b"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Hiraishin Dance LV2
[State -1, Hiraishin Dance LV2]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1500
value = 30200
triggerall = command = "hold_s" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;SUPERS:
;===========================================================================
; Rasenrengan
[State -1, Rasenrengan]
type = ChangeState
triggerall = var(2) = 0
Triggerall = power >= 2000
triggerall = numhelper(1550) = 0
value = 1500
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Bijuudama
[State -1, Bijuudama]
type = ChangeState
triggerall = var(2) = 1
triggerall = numhelper(30450) = 0
Triggerall = power >= 2000
value = 30400
triggerall = command = "hold_s" && command = "y"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;UNIQUES:
;===========================================================================
; Hiraishin no Jutsu
[State -1, Hiraishin no Jutsu]
type = ChangeState
triggerall = var(2) = 0
triggerall = numhelper(1150) = 0
Triggerall = power >= 500
value = 1100
triggerall = command = "holddown" && command = "s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;-------------------------------- er5-------------------------------------------
; Hiraishin no Jutsu Teleport
[State -1, Hiraishin no Jutsu Teleport]
type = ChangeState
triggerall = var(2) = 0
triggerall = numhelper(9002) = 0
triggerall = numhelper(1150) = 1
value = 1102
triggerall = command = "holddown" && command = "s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Kurama Hunt 
[State -1, Kurama Hunt]
type = ChangeState
triggerall = var(2) = 1
triggerall = numhelper(30550) = 0
Triggerall = power >= 1000
value = 30500
triggerall = command = "holddown" && command = "s"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; Hiraishin Rasengan
[State -1, Hiraishin Rasengan]
type = ChangeState
triggerall = var(2) = 1
Triggerall = power >= 1000
value = 30300
triggerall = command = "holddown" && command = "c"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;AWAKE TRANSFORMS
;===========================================================================
; KCM Fin
[State -1, KCM Fin]
type = ChangeState
Triggerall = var(2) = 1
triggerall = ailevel = 0
value = 554
triggerall = command = "holddown"
triggerall = command = "x"
trigger1 = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; KCM
[State -1, KCM]
type = ChangeState
Triggerall = var(2) = 0
triggerall = var(41) = 1
triggerall = ailevel = 0
value = 550
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;---------------------------------------------------------------------------
; KURAMA MODE
[State -1, KURAMA MODE]
type = ChangeState
triggerall = numhelper(9996) < 1
triggerall = numhelper(10000) = 0
triggerall = ailevel = 0
triggerall = var(41) = 1
Triggerall = var(2) = 1
value = 10001
triggerall = command = "x"
Triggerall = statetype != A
trigger1 = ctrl
trigger2 = numhelper(700) > 0
;===========================================================================
;--------------------------------Ataques Normales---------------------------
;---------------------------------------------------------------------------
; Power Charge
[State -1, Power Charge]
type = ChangeState
Triggerall = var(41)=0 || var(41)=1 && power<powermax
value = 500
triggerall = command != "holddown"
triggerall = command = "s"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 1
[State -1, Combo 1]
type = ChangeState
Triggerall = var(2) = 0
value = 200
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 1
[State -1, Combo 1]
type = ChangeState
Triggerall = var(2) = 1
value = 2200
triggerall = ailevel = 0
triggerall = command = "a"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 2
[State -1, Combo 2]
type = ChangeState
Triggerall = var(2) = 0
value = 300
triggerall = ailevel = 0
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 2
[State -1, Combo 2]
type = ChangeState
Triggerall = var(2) = 1
value = 2300
triggerall = ailevel = 0
triggerall = command = "b"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 3
[State -1, Combo 3]
type = ChangeState
Triggerall = power >= 500
triggerall = numhelper(9001) = 0
Triggerall = var(2) = 0
value = 400
triggerall = ailevel = 0
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Combo 3
[State -1, Combo 3]
type = ChangeState
Triggerall = power >= 300
triggerall = ailevel = 0
triggerall = numhelper(9001) = 0
Triggerall = var(2) = 1
value = 2400
triggerall = command = "c"
Triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
Triggerall = var(2) = 0
triggerall = ailevel = 0
value = 600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; A Aire
[State -1, A Aire]
type = ChangeState
Triggerall = var(2) = 1
triggerall = ailevel = 0
value = 2600
triggerall = command = "a"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
Triggerall = var(2) = 0
triggerall = ailevel = 0
value = 610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; B Aire
[State -1, B Aire]
type = ChangeState
Triggerall = var(2) = 1
triggerall = ailevel = 0
value = 2610
triggerall = command = "b"
Triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
; C Aire
[State -1, C Aire]
type = ChangeState
triggerall = ailevel = 0
triggerall = pos y < -70
value = 620
triggerall = power >= 200
triggerall = command = "c"
Triggerall = statetype = A
trigger1 = ctrl
