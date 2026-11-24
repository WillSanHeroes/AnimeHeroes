; __________________________
;| Edo Tensei Deidara Attack|
; ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
;====================<MAIN STATE>====================
[Statedef 0]
type=S
physics=N
movetype=I
anim=0

[State 0, OK]
type=changestate
trigger1= ctrl
trigger1= roundstate=2
trigger1= fvar(2)!=0
value=2

;====================<PLAYING>====================
[Statedef 2]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 2, Balkiry Sequences]
type=changestate
triggerall= fvar(2)
triggerall= numhelper(1000)<3
trigger1= random<10
trigger2= playerIDexist(var(5))
trigger2= playerID(var(5)),pos x>=124 && random<44
trigger3= playerIDexist(var(6))
trigger3= playerID(var(6)),pos x>=124 && random<44
value= ifelse(random<500, 200, ifelse(random<500, 201, ifelse(random<500, 202, 203)))

[State 2, Nebula Sequences]
type=changestate
trigger1= fvar(2)
trigger1= numhelper(1100)<3
trigger1= random<3
value= ifelse(random<500, 210, ifelse(random<333, 211, ifelse(random<500, 212, 213)))

[State 2, Turtloid Sequences]
type=changestate
trigger1= fvar(2)
trigger1= numhelper(1200)<1
trigger1= random<4
value= 220

[State 2, Rings]
type=changestate
trigger1= (fvar(2)!=[0,3])
trigger1= numhelper(1800)<9
trigger1= random<16
value= 280


;====================<SEQUENCES>====================
;---One Balkiry---
[Statedef 200]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 200, Positioning]; 28, 176
type=varset
trigger1= !time
;var(8)= ceil((pos y-screenpos y) + 28 + (random/6.76))
var(8)= ceil((pos y-screenpos y) +  16*(random%9))
[State 200, Speed]
type=varset
trigger1= !time
var(9)= (!numhelper(1000) && random<500)

[State 200, Balkiry]
type=helper
trigger1= !time
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)
facing= -1
ownpal=1

[State 200, End]
type=changestate
trigger1= fvar(2)=0
trigger2= ifelse(var(9)=1, time>=15, time>=25)
value= 2


;---High and Low Balkiries---
[Statedef 201]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 201, Positioning]
type=varset
trigger1= !time
var(8)= ceil(pos y-screenpos y)
[State 201, Speed]
type=varset
trigger1= !time
var(9)= (!numhelper(1000) && random<500)

[State 201, Balkiry]
type=helper
trigger1= !time
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)+60
facing= -1
ownpal=1

[State 201, Balkiry]
type=helper
trigger1= !time
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)+156
facing= -1
ownpal=1

[State 201, End]
type=changestate
trigger1= fvar(2)=0
trigger2= ifelse(var(9)=1, time>=15, time>=25)
value= 2


;---Three Valkiries---
[Statedef 202]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 202, Positioning]; 28, 112
type=varset
trigger1= !time
;var(8)= ceil((pos y-screenpos y) + 28 + (random/11.9))
var(8)= ceil((pos y-screenpos y) + 28 + 16*(random%5))
[State 202, Speed]
type=varset
trigger1= !time
var(9)= (!numhelper(1000) && random<500)

[State 202, Balkiry]
type=helper
trigger1= !time
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)
facing= -1
ownpal=1

[State 202, Balkiry]
type=helper
trigger1= ifelse(var(9)=1, time=15, time=25)
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)+32
facing= -1
ownpal=1

[State 202, Balkiry]
type=helper
trigger1= ifelse(var(9)=1, time=30, time=50)
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)+64
facing= -1
ownpal=1

[State 202, End]
type=changestate
trigger1= fvar(2)=0
trigger2= ifelse(var(9)=1, time>=45, time>=75)
value= 2


;---Three Valkiries---
[Statedef 203]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 203, Positioning]
type=varset
trigger1= !time
var(8)= ceil((pos y-screenpos y) + 125 + 16*(random%4))
[State 203, Speed]
type=varset
trigger1= !time
var(9)= (!numhelper(1000) && random<500)

[State 203, Balkiry]
type=helper
trigger1= !time
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)
facing= -1
ownpal=1

[State 203, Balkiry]
type=helper
trigger1= ifelse(var(9)=1, time=13, time=21)
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)-32
facing= -1
ownpal=1

[State 203, Balkiry]
type=helper
trigger1= ifelse(var(9)=1, time=26, time=42)
helpertype=normal
stateno= ifelse(var(9)=1, 1001, 1000)
ID=1000
name="Balkiry"
postype=left
pos= 360, var(8)-64
facing= -1
ownpal=1

[State 203, End]
type=changestate
trigger1= fvar(2)=0
trigger2= ifelse(var(9)=1, time>=39, time>=63)
value= 2



;---One Nebula---
[Statedef 210]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 210, Positioning]; 51, 211
type=varset
trigger1= !time
var(8)= ceil((pos y-screenpos y) + 28 + 24*(random%6))

[State 210, Nebula]
type=helper
trigger1= !time
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)
facing= -1
ownpal=1

[State 210, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=64
value= 2


;---Three Nebulas Horizontal---
[Statedef 211]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 211, Positioning]
type=varset
trigger1= !time
;var(8)= ceil((pos y-screenpos y) + 28 + (random/6.76))
var(8)= ceil((pos y-screenpos y) + 60 + 24*(random%4))

[State 211, Nebula]
type=helper
trigger1= !time
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)
facing= -1
ownpal=1

[State 211, Nebula]
type=helper
trigger1= time=64
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)-16
facing= -1
ownpal=1

[State 211, Nebula]
type=helper
trigger1= time=128
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)-32
facing= -1
ownpal=1

[State 211, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=192
value= 2


;---Three Nebulas Vertical---
[Statedef 212]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 212, Positioning]
type=varset
trigger1= !time
var(8)= ceil((pos y-screenpos y) + 51 + 24*(random%3))

[State 212, Nebula]
type=helper
trigger1= !time
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)
facing= -1
ownpal=1

[State 212, Nebula]
type=helper
trigger1= time=21
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+48
facing= -1
ownpal=1

[State 212, Nebula]
type=helper
trigger1= time=42
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+96
facing= -1
ownpal=1

[State 212, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=106
value= 2


;---Seven Nebulas---
[Statedef 213]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 213, Positioning]
type=varset
trigger1= !time
var(8)= ceil(pos y-screenpos y)

[State 213, Nebula]
type=helper
trigger1= !time
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+67
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= !time
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+213
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= time=43
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+91
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= time=43
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+187
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= time=86
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+115
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= time=86
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+163
facing= -1
ownpal=1

[State 213, Nebula]
type=helper
trigger1= time=129
helpertype=normal
stateno=1100
ID=1100
name="Nebula"
postype=left
pos= 344, var(8)+139
facing= -1
ownpal=1

[State 213, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=193
value= 2


;---One Turtloid---
[Statedef 220]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 220, Positioning]; 24, 155
type=varset
trigger1= !time
var(8)= ceil((pos y-screenpos y) + 24 + 32*(random%4))

[State 220, Turtloid]
type=helper
trigger1= !time
helpertype=normal
stateno=1200
ID=1200
name="Turtloid Rider"
postype=left
pos= 352, var(8)
facing= -1
ownpal=1

[State 220, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=148
value= 2


;---High and low Turtloids---
[Statedef 221]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 221, Positioning]
type=varset
trigger1= !time
var(8)= ceil(pos y-screenpos y)

[State 221, Turtloid]
type=helper
trigger1= !time
helpertype=normal
stateno=1200
ID=1200
name="Turtloid Rider"
postype=left
pos= 352, var(8)+24
facing= -1
ownpal=1

[State 221, Turtloid]
type=helper
trigger1= !time
helpertype=normal
stateno=1200
ID=1200
name="Turtloid Rider"
postype=left
pos= 352, var(8)+184
facing= -1
ownpal=1

[State 221, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=148
value= 2


;---Three Rings---
[Statedef 280]
type=S
physics=N
movetype=I
anim=0
ctrl=0

[State 280, Positioning]; 31, ?
type=varset
trigger1= !time
var(8)= ceil((pos y-screenpos y) + 31 + 20*(random%8))

[State 280, Ring]
type=helper
trigger1= !time || time=24 || time=48
helpertype=normal
stateno=1800
ID=1800
name="Ring"
postype=left
pos= 328, var(8)
facing= -1
ownpal=1

[State 280, End]
type=changestate
trigger1= fvar(2)=0
trigger2= time>=72
value= 2


;====================<DISPLAY>====================
[Statedef 500]
movetype=I
physics=N
anim=0

[State 500, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 500, No Bars]
type=assertspecial
trigger1= !numpartner
flag=nobardisplay
[State 500, No Bars]
type=assertspecial
triggerall= numpartner
trigger1= partner,name="Duck Hunt" && partner,authorname="Phantom.of.the.Server"
trigger2= partner,name="Catwalk" && partner,authorname="Phantom.of.the.Server"
trigger3= partner,name="SS1 Bonus" && partner,authorname="Phantom.of.the.Server"
trigger4= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
flag=nobardisplay

[State 500, Score Board]
type=explod
trigger1= !numexplod(510)
anim=510
ID=510
sprpriority=32
postype=left
pos=16,9
scale=1,1
bindtime=-1
removetime=-1
pausemovetime=-1
supermovetime=-1

;---Timer---
[State 500, Minutes 1]
type=varset
trigger1= root,var(2)=[1,599]
var(12)= floor(root,var(2)/60.0)
[State 500, Seconds 10]
type=varset
trigger1= root,var(2)=[1,599]
var(11)= floor((root,var(2)%60)/10.0)
[State 500, Seconds 1]
type=varset
trigger1= root,var(2)=[1,599]
var(10)= (root,var(2)%10)

[State 500, Min]
type=varrangeset
trigger1= root,var(2)<=0
first=10
last=13
value=0
[State 500, Max]
type=varset
trigger1= root,var(2)>=600
var(12)=9
[State 500, Max]
type=varset
trigger1= root,var(2)>=600
var(11)=5
[State 500, Max]
type=varset
trigger1= root,var(2)>=600
var(10)=9

[State 500, Seconds 1]
type=explod
trigger1= 1
anim=520+var(10)
ID=520
sprpriority=32
postype=left
pos= 80, 25
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, Seconds 10]
type=explod
trigger1= 1
anim=520+var(11)
ID=520
sprpriority=32
postype=left
pos= 72, 25
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, Minutes 1]
type=explod
trigger1= 1
anim=520+var(12)
ID=520
sprpriority=32
postype=left
pos= 56, 25
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1


;---Score---
[State 500, 100000]
type=varset
trigger1= root,var(10)=[1,999998]
var(25)= floor(root,var(10)/100000.0)
[State 500, 10000]
type=varset
trigger1= root,var(10)=[1,999998]
var(24)= floor(root,var(10)/10000.0) - (var(25)*10)
[State 500, 1000]
type=varset
trigger1= root,var(10)=[1,999998]
var(23)= floor(root,var(10)/1000.0) - (var(24)*10) - (var(25)*100)
[State 500, 100]
type=varset
trigger1= root,var(10)=[1,999998]
var(22)= floor(root,var(10)/100.0) - (var(23)*10) - (var(24)*100) - (var(25)*1000)
[State 500, 10]
type=varset
trigger1= root,var(10)=[1,999998]
var(21)= floor(root,var(10)/10.0) - (var(22)*10) - (var(23)*100) - (var(24)*1000) - (var(25)*10000)
[State 500, 1]
type=varset
trigger1= root,var(10)=[1,999998]
var(20)= root,var(10) - (var(21)*10) - (var(22)*100) - (var(23)*1000) - (var(24)*10000) - (var(25)*100000)

[State 500, Min]
type=varrangeset
trigger1= root,var(10)<=0
first=20
last=25
value=0
[State 500, Max]
type=varrangeset
trigger1= root,var(10)>=999999
first=20
last=25
value=9

[State 500, 1]
type=explod
trigger1= 1
anim=520+var(20)
ID=520
sprpriority=32
postype=left
pos=104,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 10]
type=explod
trigger1= var(21) || var(22) || var(23) || var(24) || var(25)
anim=520+var(21)
ID=520
sprpriority=32
postype=left
pos=96,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 100]
type=explod
trigger1= var(22) || var(23) || var(24) || var(25)
anim=520+var(22)
ID=520
sprpriority=32
postype=left
pos=88,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 1000]
type=explod
trigger1= var(23) || var(24) || var(25)
anim=520+var(23)
ID=520
sprpriority=32
postype=left
pos=80,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 10000]
type=explod
trigger1= var(24) || var(25)
anim=520+var(24)
ID=520
sprpriority=32
postype=left
pos=72,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 100000]
type=explod
trigger1= var(25)
anim=520+var(25)
ID=520
sprpriority=32
postype=left
pos=64,9
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1

;---Rings---
[State 500, 100]
type=varset
trigger1= root,var(13)=[1,998]
var(32)= floor(root,var(13)/100.0)
[State 500, 10]
type=varset
trigger1= root,var(13)=[1,998]
var(31)= floor(root,var(13)/10.0) - (var(32)*10)
[State 500, 1]
type=varset
trigger1= root,var(13)=[1,998]
var(30)= root,var(13) - (var(31)*10) - (var(32)*100)

[State 500, Min]
type=varrangeset
trigger1= root,var(13)<=0
first=30
last=32
value=0
[State 500, Max]
type=varrangeset
trigger1= root,var(13)>=999
first=30
last=32
value=9

[State 500, 1]
type=explod
trigger1= 1
anim=520+var(30)
ID=520
sprpriority=32
postype=left
pos=80,41
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 10]
type=explod
trigger1= var(31) || var(32)
anim=520+var(31)
ID=520
sprpriority=32
postype=left
pos=72,41
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 500, 100]
type=explod
trigger1= var(32)
anim=520+var(32)
ID=520
sprpriority=32
postype=left
pos=64,41
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1

[State 500, Lag]
type=varset
trigger1= roundstate!=4
var(1)=0
[State 500, Lag]
type=varadd
trigger1= roundstate=4
var(1)=1

[State 500, End]
type=changestate
trigger1= var(1)>=60
value=581

[State 500, End]
type=destroyself
trigger1= root,var(4)=2


;---Roundstate Transition---
[Statedef 581]
movetype=I
physics=N
anim=0

[State 581, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 581, Reset]
type=removeexplod
trigger1= !time
[State 581, Reset]
type=varrangeset
trigger1= !time
first=0
last=59
value=0

[State 581, No Bars]
type=assertspecial
trigger1= root,fvar(1)!=-2
trigger1= !numpartner
flag=nobardisplay
[State 581, No Bars]
type=assertspecial
triggerall= root,fvar(1)!=-2
triggerall= numpartner
trigger1= partner,name="SS1 Bonus" && partner,authorname="Phantom.of.the.Server"
trigger2= partner,name="Duck Hunt" && partner,authorname="Phantom.of.the.Server"
trigger3= partner,name="Catwalk" && partner,authorname="Phantom.of.the.Server"
trigger4= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
flag=nobardisplay

[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999
[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999
[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999
[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999
[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999
[State 581, Music]
type=playsnd
trigger1= !time
value= 3,0
volume=999

[State 581, Score Board]
type=explod
trigger1= !numexplod(510)
anim=510
ID=510
sprpriority=32
postype=left
pos=16,9
scale=1,1
bindtime=-1
removetime=-1
pausemovetime=-1
supermovetime=-1

[State 581, Score Board]
type=explod
trigger1= !numexplod(580)
anim=580
ID=580
sprpriority=32
postype=left
pos=56,120
scale=1,1
bindtime=-1
removetime=-1
pausemovetime=-1
supermovetime=-1

[State 581, Animation]
type=modifyexplod
trigger1= numexplod(510)
ID=510
pos= 16 - (time*24), 9
postype=left
bindtime=-1

[State 581, Animation]
type=modifyexplod
trigger1= numexplod(580)
ID=580
pos= 440 - (time*24), 120
postype=left
bindtime=-1

[State 581, End]
type=removeexplod
trigger1= time>=16
[State 581, End]
type=changestate
trigger1= !numexplod
value=580


;---End Results---
[Statedef 580]
movetype=I
physics=N
anim=0

[State 580, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 580, No Bars]
type=assertspecial
trigger1= root,fvar(1)!=-2
trigger1= !numpartner
flag=nobardisplay
[State 580, No Bars]
type=assertspecial
triggerall= root,fvar(1)!=-2
triggerall= numpartner
trigger1= partner,name="SS1 Bonus" && partner,authorname="Phantom.of.the.Server"
trigger2= partner,name="Duck Hunt" && partner,authorname="Phantom.of.the.Server"
trigger3= partner,name="Catwalk" && partner,authorname="Phantom.of.the.Server"
trigger4= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
flag=nobardisplay

[State 580, Music]
type=assertspecial
trigger1= time<344
flag= roundnotover

[State 580, Sound]
type=playsnd
trigger1= !time
value= 3,1
channel=2
persistent= 0

[State 580, Score Board]
type=explod
trigger1= !numexplod(580)
anim=580
ID=580
sprpriority=32
postype=left
pos=56,120
scale=1,1
bindtime=-1
removetime=-1
pausemovetime=-1
supermovetime=-1

;---Total Score---
[State 580, 100000]
type=varset
trigger1= root,var(10)=[1,999998]
var(15)= floor(root,var(10)/100000.0)
[State 580, 10000]
type=varset
trigger1= root,var(10)=[1,999998]
var(14)= floor(root,var(10)/10000.0) - (var(15)*10)
[State 580, 1000]
type=varset
trigger1= root,var(10)=[1,999998]
var(13)= floor(root,var(10)/1000.0) - (var(14)*10) - (var(15)*100)
[State 580, 100]
type=varset
trigger1= root,var(10)=[1,999998]
var(12)= floor(root,var(10)/100.0) - (var(13)*10) - (var(14)*100) - (var(15)*1000)
[State 580, 10]
type=varset
trigger1= root,var(10)=[1,999998]
var(11)= floor(root,var(10)/10.0) - (var(12)*10) - (var(13)*100) - (var(14)*1000) - (var(15)*10000)
[State 580, 1]
type=varset
trigger1= root,var(10)=[1,999998]
var(10)= root,var(10) - (var(11)*10) - (var(12)*100) - (var(13)*1000) - (var(14)*10000) - (var(15)*100000)

[State 580, Min]
type=varrangeset
trigger1= root,var(10)<=0
first=20
last=25
value=0
[State 580, Max]
type=varrangeset
trigger1= root,var(10)>=999999
first=20
last=25
value=9

[State 580, 1]
type=explod
trigger1= 1
anim=520+var(10)
ID=520
sprpriority=32
postype=left
pos=248,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10]
type=explod
trigger1= var(11) || var(12) || var(13) || var(14) || var(15)
anim=520+var(11)
ID=520
sprpriority=32
postype=left
pos=240,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 100]
type=explod
trigger1= var(12) || var(13) || var(14) || var(15)
anim=520+var(12)
ID=520
sprpriority=32
postype=left
pos=232,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 1000]
type=explod
trigger1= var(13) || var(14) || var(15)
anim=520+var(13)
ID=520
sprpriority=32
postype=left
pos=224,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10000]
type=explod
trigger1= var(14) || var(15)
anim=520+var(14)
ID=520
sprpriority=32
postype=left
pos=216,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 100000]
type=explod
trigger1= var(15)
anim=520+var(15)
ID=520
sprpriority=32
postype=left
pos=208,152
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1

;---Ring Bonus---
[State 580, 10000]
type=varset
trigger1= (root,var(13) * 100)=[1,999998]
var(24)= floor((root,var(13) * 100)/10000.0)
[State 580, 1000]
type=varset
trigger1= (root,var(13) * 100)=[1,99998]
var(23)= floor((root,var(13) * 100)/1000.0) - (var(24)*10)
[State 580, 100]
type=varset
trigger1= (root,var(13) * 100)=[1,99998]
var(22)= floor((root,var(13) * 100)/100.0) - (var(23)*10) - (var(24)*100)
[State 580, 10]
type=varset
trigger1= (root,var(13) * 100)=[1,99998]
var(21)= floor((root,var(13) * 100)/10.0) - (var(22)*10) - (var(23)*100) - (var(24)*1000)
[State 580, 1]
type=varset
trigger1= (root,var(13) * 100)=[1,99998]
var(20)= (root,var(13) * 100) - (var(21)*10) - (var(22)*100) - (var(23)*1000) - (var(24)*10000)

[State 580, Min]
type=varrangeset
trigger1= (root,var(13) * 100)<=0
first=20
last=24
value=0
[State 580, Max]
type=varrangeset
trigger1= (root,var(13) * 100)>=99999
first=20
last=24
value=9

[State 580, 1]
type=explod
trigger1= 1
anim=520+var(20)
ID=520
sprpriority=32
postype=left
pos=248,120
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10]
type=explod
trigger1= var(21) || var(22) || var(23) || var(24)
anim=520+var(21)
ID=520
sprpriority=32
postype=left
pos=240,120
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 100]
type=explod
trigger1= var(22) || var(23) || var(24)
anim=520+var(22)
ID=520
sprpriority=32
postype=left
pos=232,120
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 1000]
type=explod
trigger1= var(23) || var(24)
anim=520+var(23)
ID=520
sprpriority=32
postype=left
pos=224,120
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10000]
type=explod
trigger1= var(24)
anim=520+var(24)
ID=520
sprpriority=32
postype=left
pos=216,120
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1

;---Perfect Bonus---
[State 580, 100000]
type=varset
trigger1= root,var(17)=[1,999998]
var(35)= floor(root,var(17)/100000.0)
[State 580, 10000]
type=varset
trigger1= root,var(17)=[1,999998]
var(34)= floor(root,var(17)/10000.0) - (var(35)*10)
[State 580, 1000]
type=varset
trigger1= root,var(17)=[1,999998]
var(33)= floor(root,var(17)/1000.0) - (var(34)*10) - (var(35)*100)
[State 580, 100]
type=varset
trigger1= root,var(17)=[1,999998]
var(32)= floor(root,var(17)/100.0) - (var(33)*10) - (var(34)*100) - (var(35)*1000)
[State 580, 10]
type=varset
trigger1= root,var(17)=[1,999998]
var(31)= floor(root,var(17)/10.0) - (var(32)*10) - (var(33)*100) - (var(34)*1000) - (var(35)*10000)
[State 580, 1]
type=varset
trigger1= root,var(17)=[1,999998]
var(30)= root,var(17) - (var(31)*10) - (var(32)*100) - (var(33)*1000) - (var(34)*10000) - (var(35)*100000)

[State 580, Min]
type=varrangeset
trigger1= root,var(17)<=0
first=30
last=35
value=0
[State 580, Max]
type=varrangeset
trigger1= root,var(17)>=999999
first=30
last=35
value=9

[State 580, 1]
type=explod
trigger1= 1
anim=520+var(30)
ID=520
sprpriority=32
postype=left
pos=248,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10]
type=explod
trigger1= var(31) || var(32) || var(33) || var(34) || var(35)
anim=520+var(31)
ID=520
sprpriority=32
postype=left
pos=240,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 100]
type=explod
trigger1= var(32) || var(33) || var(34) || var(35)
anim=520+var(32)
ID=520
sprpriority=32
postype=left
pos=232,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 1000]
type=explod
trigger1= var(33) || var(34) || var(35)
anim=520+var(33)
ID=520
sprpriority=32
postype=left
pos=224,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 10000]
type=explod
trigger1= var(34) || var(35)
anim=520+var(34)
ID=520
sprpriority=32
postype=left
pos=216,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1
[State 580, 100000]
type=explod
trigger1= var(35)
anim=520+var(35)
ID=520
sprpriority=32
postype=left
pos=208,136
bindtime=-1
removetime=1
pausemovetime=-1
supermovetime=-1

[State 580, End]
type=destroyself
trigger1= root,var(4)=2
trigger2= roundstate!=4


;====================<INTRO HELPER>====================
[Statedef 590]
type=A
physics=N
movetype=I
anim=0
ctrl=0

;[State 590, Text 1]
type=explod
trigger1= !time
anim=593
ID=593
sprpriority=37
postype=left
pos=160,120
scale=1,1
bindtime=-1
removetime=240

[State 590, End]
type=removeexplod
trigger1= time>=240

[State 590, End]
type=changestate
trigger1= !numexplod
value=0

;====================<AIRPLANE>====================
;---Player 1---
[Statedef 900]
type=A
physics=N
movetype=I
sprpriority=-6
anim=900

[State 900, Anim]
type=changeanim
trigger1= anim!=900
value= 900
[State 900, Facing]
type=turn
trigger1= facing!=1

[State 900, Bind]
type=posset
trigger1= !time
trigger1= playerIDexist(root,var(5))
x= ceil(playerID(root,var(5)), pos x)

[State 900, Follow]
type=posadd
trigger1= playerIDexist(root,var(5))
trigger1= abs((playerID(root,var(5)),pos x - pos x) * facing) = [1,12)
x= ceil((playerID(root,var(5)),pos x - pos x) * facing)
[State 900, Follow]
type=posadd
trigger1= playerIDexist(root,var(5))
trigger1= abs((playerID(root,var(5)),pos x - pos x) * facing) >= 12
x= ifelse(((playerID(root,var(5)),pos x - pos x) * facing)<0, -12, 12)

[State 900, Tails]
type=helper
trigger1= !numhelper(980)
trigger1= playerIDexist(root,var(5))
helpertype=normal
stateno=980
ID=980
name="Tails"
postype=left
ownpal=1

[State 900, Behaviour - None]
type=varset
trigger1= !time
var(1)= 0 + 0*(var(2):=0)
[State 900, Behaviour - Normal]
type=varset
trigger1= var(1)=0
trigger1= playerIDexist(root,var(5))
trigger1= playerID(root,var(5)),pos y=[0,16]
trigger2= var(1)=3 && var(2)>6
var(1)= 1 + 0*(var(2):=0)
[State 900, Behaviour - React to jump]
type=varset
triggerall= var(1)=1 || var(1)=3
trigger1= playerIDexist(root,var(5))
trigger1= playerID(root,var(5)),pos y<0
var(1)= 2 + 0*(var(2):=0)
[State 900, Behaviour - React to landing]
type=varset
triggerall= var(1)=2
trigger1= playerIDexist(root,var(5))
trigger1= playerID(root,var(5)),pos y=[0,16]
var(1)= 3 + 0*(var(2):=0)

[State 900, Behaviour Timing]
type=varadd
trigger1= 1
var(2)= 1

[State 900, Behaviour]
type=posset
trigger1= 1
y= 0
[State 900, Behaviour]
type=posset
trigger1= var(1)=2
trigger1= var(2)=[1,24]
y= ceil(sin(var(2)/24.0*pi) * 12)
[State 900, Behaviour]
type=posset
trigger1= var(1)=3
trigger1= var(2)=[1,6]
y= ifelse((var(2)%2), 1, 0)

[State 900, End]
type=destroyself
trigger1= !playerIDexist(root,var(5))


;---Player 2---
[Statedef 910]
type=A
physics=N
movetype=I
sprpriority=-7
anim=5301

[State 910, Anim]
type=changeanim
trigger1= anim!=5301
value= 900
[State 910, Facing]
type=turn
trigger1= facing!=1

[State 910, Bind]
type=posset
trigger1= !time
trigger1= playerIDexist(root,var(6))
x= ceil(playerID(root,var(6)), pos x)

[State 910, Follow]
type=posadd
trigger1= playerIDexist(root,var(6))
trigger1= abs((playerID(root,var(6)),pos x - pos x) * facing) = [1,12)
x= ceil((playerID(root,var(6)),pos x - pos x) * facing)
[State 910, Follow]
type=posadd
trigger1= playerIDexist(root,var(6))
trigger1= abs((playerID(root,var(6)),pos x - pos x) * facing) >= 12
x= ifelse(((playerID(root,var(6)),pos x - pos x) * facing)<0, -12, 12)

[State 910, Amy]
type=helper
trigger1= !numhelper(990)
trigger1= playerIDexist(root,var(6))
helpertype=normal
stateno=990
ID=990
name="Amy"
postype=left
ownpal=1

[State 910, Behaviour - None]
type=varset
trigger1= !time
var(1)= 0 + 0*(var(2):=0)
[State 910, Behaviour - Normal]
type=varset
trigger1= var(1)=0
trigger1= playerIDexist(root,var(6))
trigger1= playerID(root,var(6)),pos y=[0,16]
trigger2= var(1)=3 && var(2)>6
var(1)= 1 + 0*(var(2):=0)
[State 910, Behaviour - React to jump]
type=varset
triggerall= var(1)=1 || var(1)=3
trigger1= playerIDexist(root,var(6))
trigger1= playerID(root,var(6)),pos y<0
var(1)= 2 + 0*(var(2):=0)
[State 910, Behaviour - React to landing]
type=varset
triggerall= var(1)=2
trigger1= playerIDexist(root,var(6))
trigger1= playerID(root,var(6)),pos y=[0,16]
var(1)= 3 + 0*(var(2):=0)

[State 910, Behaviour Timing]
type=varadd
trigger1= 1
var(2)= 1

[State 910, Behaviour]
type=posset
trigger1= 1
y= 0
[State 910, Behaviour]
type=posset
trigger1= var(1)=2
trigger1= var(2)=[1,24]
y= ceil(sin(var(2)/24.0*pi) * 12)
[State 910, Behaviour]
type=posset
trigger1= var(1)=3
trigger1= var(2)=[1,6]
y= ifelse((var(2)%2), 1, 0)

[State 910, End]
type=destroyself
trigger1= !playerIDexist(root,var(6))


;====================<TAILS>====================
[Statedef 980]
type=A
physics=N
movetype=I
sprpriority=6
anim=980

[State 980, Bind]
type=varset
trigger1= !var(1)
var(1)= parent,ID
[State 980, Bind]
type=bindtoparent
type=posset
trigger1= playerIDexist(var(1))
facing= 1
pos= 0,0

[State 980, End]
type=destroyself
trigger1= !playerIDexist(var(1))

[State 980, Anim]
type=changeanim
trigger1= anim=980
trigger1= animelemtime(1)>=30 && random<17
value= 981
[State 980, Anim]
type=changeanim
trigger1= anim=981
trigger1= animelemtime(1)>=30 && random<17
value= ifelse(random<500, 983, ifelse(random<500, 980, 982))
[State 980, Anim]
type=changeanim
trigger1= anim=982
trigger1= animelemtime(1)>=30 && random<17
value= ifelse(random<500, 980, 981)
[State 980, Anim]
type=changeanim
trigger1= anim=983
trigger1= !animtime
value= 981


;====================<AMY>====================
[Statedef 990]
type=A
physics=N
movetype=I
sprpriority=-7
anim=990

[State 990, Bind]
type=varset
trigger1= !var(1)
var(1)= parent,ID
[State 990, Bind]
type=bindtoparent
trigger1= playerIDexist(var(1))
facing= 1
pos= 0,0

[State 990, End]
type=destroyself
trigger1= !playerIDexist(var(1))

[State 990, Anim]
type=changeanim
trigger1= anim=990
trigger1= animelemtime(1)>=30 && random<17
value= 991
[State 990, Anim]
type=changeanim
trigger1= anim=991
trigger1= !animtime
value= 990





;---GET HIT---
[Statedef 1090]
type=A
physics=N
movetype=H
anim= 0
ctrl=0
velset=0,0
damage=200

[State 1090, NHB]
type=nothitby
trigger1= 1
value=SCA
time=-1
ignorehitpause=1

[State 1090, Sound]
type=playsnd
trigger1= !time
value= 1,0
[State 1090, Smoke]
type=explod
trigger1= !time
anim= 1090
sprpriority= -8
postype= p1
pos= 0, 0
vel= (-.5 * facing), 0
scale= 1, 1
facing= facing
ownpal= 1

[State 1090, Animal]
type=helper
trigger1= !time
helpertype=normal
stateno=1900
ID=1900
name="Animal"
postype=p1
pos=0,0
ownpal=1

[State 1090, Combo]
type=parentvarset
trigger1= !time
trigger1= roundstate=2
var(11)= 180
[State 1090, Combo]
type=parentvaradd
trigger1= !time
trigger1= roundstate=2
var(12)= 1

[State 1090, Score]
type=parentvaradd
trigger1= !time
trigger1= roundstate=2
var(10)= ifelse((root,var(12)>=16), 10000, ifelse((root,var(12)=[4,15]), 1000, ifelse((root,var(12)=3), 500, ifelse((root,var(12)=2), 200, 100))))

[State 1090, Score Display]
type=explod
trigger1= !time
trigger1= roundstate=2
anim= ifelse((root,var(12)>=16), 1099, ifelse((root,var(12)=[4,15]), 1098, ifelse((root,var(12)=3), 1097, ifelse((root,var(12)=2), 1096, 1095))))
sprpriority=30
postype= p1
pos= 0, 0
vel= (-.5 * facing), -3.2
accel= 0, .1
scale= 1, 1
facing= facing
ownpal= 1
removetime=32

[State 1090, End]
type=changestate
trigger1= 1
value= 1091


;---DISAPPEAR---
[Statedef 1091]
type=A
physics=N
movetype=H
anim= 0
ctrl=0
velset=0,0

[State 1091, Rings Missed]
type=parentvaradd
trigger1= !time
trigger1= ishelper(1800)
var(15)= 1

[State 1091, End]
type=removeexplod
trigger1= numexplod(1005)
ID= 1005
[State 1091, End]
type=destroyself
trigger1= time>=2


;====================<NEBULA>====================
;---IDLE---
[Statedef 1100]
type=A
physics=N
movetype=I
anim=1100
ctrl=0
sprpriority=-12

[State 1100, Override]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1090
ignorehitpause=1
[State 1100, HB]
type=hitby
trigger1= 1
time=-1
value=SCA,AA,AP
ignorehitpause=1

[State 1100, Vel]
type=velset
trigger1= 1
x= 0.75

[State 1100, Attack]
type=changestate
trigger1= p2dist x<=160
value= 1101

[State 1100, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= screenpos y>=264
trigger3= (facing=-1 && pos x<=-184) || (facing=1 && pos x>=184)
value= 1091


;---ATTACKING---
[Statedef 1101]
type=A
physics=N
movetype=I
ctrl=0
sprpriority=-12

[State 1101, Vel]
type=velset
trigger1= 1
x= 0.75

[State 1101, Vel]
type=veladd
trigger1= time=[0,79]
y= -.01
[State 1101, Vel]
type=veladd
trigger1= time=[80,279]
y= .01

[State 1101, Sound]
type=playsnd
trigger1= numenemy
trigger1= roundstate=2
trigger1= p2dist y>=32
trigger1= abs((enemynear,pos x - pos x) * facing) <= enemynear,const(size.ground.front)
persistent= 0
value= 1,1
volume = 150

[State 1101, Projectile]
type=projectile
trigger1= numenemy
trigger1= roundstate=2
trigger1= p2dist y>=32
trigger1= abs((enemynear,pos x - pos x) * facing) <= enemynear,const(size.ground.front)
persistent= 0
ProjID = 1105
projanim = 1105
projhitanim = 1090
projremanim = 0
projcancelanim = 0
projremove = 1
projremovetime = -1
projhits = 1
projpriority = 1
postype = p1
offset = 0, 8
velocity = vel x, vel y
accel = 0, .125
remvelocity = 0, 0
projscale = 1, 1
projsprpriority = -12
projedgebound = 40
projheightbound = -360, 120
attr = A,NP
hitflag = MA-
guardflag =
damage = 0, 0
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 16
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -5.0, -7.5
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
fall.recover = 1
fall.recovertime = 0
forcestand = 0
hitsound = S1,0
guardsound = 6, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, 0
palfx.time = 16
palfx.add = 128,128,128
palfx.sinadd= 128,128,128,4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1101, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= screenpos y>=264
trigger3= (facing=-1 && pos x<=-184) || (facing=1 && pos x>=184)
value= 1091

;====================<TURTLOID>====================
;---Rider IDLE---
[Statedef 1200]
type=A
physics=N
movetype=I
anim=1200
ctrl=0
sprpriority=-14

[State 1200, Override]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1090
ignorehitpause=1
[State 1200, HB]
type=hitby
trigger1= 1
time=-1
value=SCA,AA,AP
ignorehitpause=1

[State 1200, Too many helpers]
type=changestate
triggerall= !time
trigger1= !numpartner && numenemy=1
trigger1= (root,numhelper + enemy,numhelper) >= 32
trigger2= !numpartner && numenemy>=2
trigger2= (root,numhelper + enemy(0),numhelper + enemy(1),numhelper) >= 32
trigger3= numpartner && numenemy=1
trigger3= (root,numhelper + partner,numhelper + enemy,numhelper) >= 32
trigger4= numpartner && numenemy>=2
trigger4= (root,numhelper + partner,numhelper + enemy(0),numhelper + enemy(1),numhelper) >= 32
value= 1091

[State 1200, Turtloid]
type=helper
trigger1= !var(1)
trigger1= var(1):=1
helpertype=normal
stateno=1210
ID=1210
name="Turtloid"
postype=p1
pos= 4, 24
ownpal=1

[State 1200, Vel]
type=velset
trigger1= 1
x= 0.5

[State 1200, Attack]
type=changestate
trigger1= roundstate=2
trigger1= pos x=[-172,172]
trigger1= p2dist x<=160
value= 1201

[State 1200, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-200) || (facing=1 && pos x>=200)
value= 1091


;---Rider ATTACKING---
[Statedef 1201]
type=A
physics=N
movetype=I
anim=1201
ctrl=0
sprpriority=-14
damage=100

[State 1201, Vel]
type=velset
trigger1= 1
x= 0.5

[State 1201, Vel]
type=velset
trigger1= time<14
x= 0

[State 1201, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-200) || (facing=1 && pos x>=200)
value= 1091


;---Turtloid IDLE---
[Statedef 1210]
type=A
physics=N
movetype=I
anim=1210
ctrl=0
sprpriority=-15

[State 1210, Override]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1090
ignorehitpause=1
[State 1210, HB]
type=hitby
trigger1= 1
time=-1
value=SCA,AA,AP
ignorehitpause=1

[State 1210, Vel]
type=velset
trigger1= 1
x= 0.5

[State 1210, Bind]
type=varset
trigger1= !var(1)
var(1)= parent,ID
[State 1210, Bind]
type=bindtoparent
trigger1= playerIDexist(var(1))
trigger1= playerID(var(1)),stateno=[1200,1201]
facing= 1
pos= 4,24

[State 1210, Jet]
type=explod
trigger1= !numexplod(1005)
anim=1005
ID=1005
sprpriority=-15
postype=p1
pos=-29,9
bindtime=-1
removetime=640

[State 1210, Attack]
type=changestate
trigger1= playerIDexist(var(1))
trigger1= playerID(var(1)),stateno=1201
value= 1211

[State 1210, Fall]
type=changestate
trigger1= !playerIDexist(var(1))
value= 1212

[State 1210, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-204) || (facing=1 && pos x>=204)
value= 1091


;---Turtloid ATTACKING---
[Statedef 1211]
type=A
physics=N
movetype=I
anim=1211
ctrl=0
sprpriority=-15

[State 1211, Vel]
type=velset
trigger1= 1
x= 0.5

[State 1211, Vel]
type=velset
trigger1= time<14
x= 0

[State 1211, Bind]
type=bindtoparent
trigger1= playerIDexist(var(1))
trigger1= playerID(var(1)),stateno=[1200,1201]
pos= 4,24

[State 1211, Jet]
type=explod
trigger1= !numexplod(1005)
anim=1005
ID=1005
sprpriority=-15
postype=p1
pos=-29,9
bindtime=-1
removetime=640

[State 1211, Sound]
type=playsnd
trigger1= !time
value= 1,2
volume = 150

[State 1090, Smoke]
type=explod
trigger1= movehit = 1
anim= 1090
sprpriority= -8
postype= p1
pos= 0, 0
vel= (-.5 * facing), 0
scale= 0.60, 0.60
facing= facing
ownpal= 1


[State 1211, Projectile]
type=projectile
trigger1= !time
ProjID = 1205
projanim = 1205
projhitanim = 1090
projremanim = 0
projcancelanim = 0
projremove = 1
projremovetime = -1
projhits = 1
projpriority = 1
postype = p1
offset = 18, 8
velocity = 4, 0
remvelocity = 0, 0
projscale = 1, 1
projsprpriority = -14
projedgebound = 40
projheightbound = -360, 120
attr = A,NP
hitflag = MA-
guardflag =
damage = 0, 0
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = Low
air.type = Low
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 16
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -5.0, -7.5
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
fall.recover = 1
fall.recovertime = 0
forcestand = 0
hitsound = S1, 0
guardsound = 6, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, 0
palfx.time = 16
palfx.add = 128,128,128
palfx.sinadd= 128,128,128,4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120

[State 1210, Fall]
type=changestate
trigger1= !playerIDexist(var(1))
value= 1212

[State 1211, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-204) || (facing=1 && pos x>=204)
value= 1091

;---Turtloid FALLING---
[Statedef 1212]
type=A
physics=N
movetype=I
anim=0
ctrl=0
sprpriority=-15

;[State 1212, Vel]
type=velset
trigger1= 1
x= 0.5
;[State 1212, Vel]
type=veladd
trigger1= time>=16
y= .075

[State 1212, End]
type=removeexplod
trigger1= numexplod(1005)
ID= 1005

;[State 1212, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= screenpos y>=256
trigger3= (facing=-1 && pos x<=-204) || (facing=1 && pos x>=204)
value= 1091


;====================<RING>====================
[Statedef 1800]
type=A
physics=N
movetype=I
anim=1800
ctrl=0
sprpriority=4


[State 1800, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 1800, Synch]
type=changeanim
trigger1= 1
value=1800
elem= ifelse(((gametime%32)=[0,7]), 1, ifelse(((gametime%32)=[8,15]), 2, ifelse(((gametime%32)=[16,23]), 3, 4)))

[State 1900, Turn]
type=turn
trigger1= facing!=1

[State 1800, Vel]
type=velset
trigger1= 1
x= -1

[State 1800, Collected]
type=changestate
triggerall= roundstate=2
triggerall= numenemy
triggerall= enemynear,movetype!=H
triggerall= abs((enemynear,pos x - pos x) * facing) <= (enemynear,const(size.ground.front) + 8)
trigger1= enemynear,statetype=S
trigger1= (enemynear,pos y - pos y) = [-8, (-enemynear,const(size.head.pos.y) + 8)]
trigger2= enemynear,statetype=C
trigger2= (enemynear,pos y - pos y) = [-8, (-enemynear,const(size.head.pos.y) - 24)]
trigger3= enemynear,statetype=A
trigger3= (enemynear,pos y - pos y) = [24, (-enemynear,const(size.head.pos.y) + 16)]
value= 1801

[State 1800, Missed]
type=parentvaradd
trigger1= roundstate>2
var(15)=1
persistent=0

[State 1800, End]
type=changestate
trigger1= pos x!=[-192,192]
value= 1091


;---COLLECTED---
[Statedef 1801]
type=A
physics=N
movetype=H
anim=1801
ctrl=0
sprpriority=4

[State 1801, Sound]
type=playsnd
trigger1= !time
value= 2,0

[State 1801, Score]
type=parentvaradd
trigger1= !time
trigger1= roundstate=2
var(13)= 1

[State 1801, End]
type=destroyself
trigger1= !animtime


;---LOST---
[Statedef 1810]
type=A
physics=N
movetype=I
anim=0
ctrl=0

[State 1810, Ring Count]
type=varset
trigger1= !time
var(1)= root,var(14)

[State 1810, Facing]
type=turn
trigger1= facing!=1

[State 1810, Sound]
type=playsnd
trigger1= !time
value= 2,1
[State 1810, Sound]
type=playsnd
trigger1= !time
value= 2,1
[State 1810, Sound]
type=playsnd
trigger1= !time
value= 2,1
[State 1810, Sound]
type=playsnd
trigger1= !time
value= 2,1

[State 1810, Slowdown]
type=pause
trigger1= var(1)=[9,16]
trigger1= (time%2)=1 && time=[0,31]
time=1
[State 1810, Slowdown]
type=pause
trigger1= var(1)>=17
trigger1= (time=[0,15]) || ((time%2)=1 && time=[16,47])
time=1

[State 1810, Ring 1]
type=explod
trigger1= !time && var(1)>=1
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(1/8.0*pi) * 4), (cos(1/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 2]
type=explod
trigger1= !time && var(1)>=2
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(16/8.0*pi) * 4), (cos(16/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 3]
type=explod
trigger1= !time && var(1)>=3
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(15/8.0*pi) * 4), (cos(15/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 4]
type=explod
trigger1= !time && var(1)>=4
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(2/8.0*pi) * 4), (cos(2/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 5]
type=explod
trigger1= !time && var(1)>=5
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(14/8.0*pi) * 4), (cos(14/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 6]
type=explod
trigger1= !time && var(1)>=6
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(3/8.0*pi) * 4), (cos(3/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 7]
type=explod
trigger1= !time && var(1)>=7
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(13/8.0*pi) * 4), (cos(13/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 8]
type=explod
trigger1= !time && var(1)>=8
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(4/8.0*pi) * 4), (cos(4/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 9]
type=explod
trigger1= !time && var(1)>=9
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(12/8.0*pi) * 4), (cos(12/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 10]
type=explod
trigger1= !time && var(1)>=10
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(5/8.0*pi) * 4), (cos(5/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 11]
type=explod
trigger1= !time && var(1)>=11
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(11/8.0*pi) * 4), (cos(11/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 12]
type=explod
trigger1= !time && var(1)>=12
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(6/8.0*pi) * 4), (cos(6/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 13]
type=explod
trigger1= !time && var(1)>=13
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(10/8.0*pi) * 4), (cos(10/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 14]
type=explod
trigger1= !time && var(1)>=14
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(7/8.0*pi) * 4), (cos(7/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 15]
type=explod
trigger1= !time && var(1)>=15
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(9/8.0*pi) * 4), (cos(9/8.0*pi) * -4)
accel= 0, .125
removetime=180

[State 1810, Ring 16]
type=explod
trigger1= !time && var(1)>=16
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(8/8.0*pi) * 4), (cos(8/8.0*pi) * -4)
accel= 0, .125
removetime=180



[State 1810, Ring 17]
type=explod
trigger1= !time && var(1)>=17
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(1/8.0*pi) * 6), (cos(1/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 18]
type=explod
trigger1= !time && var(1)>=18
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(16/8.0*pi) * 6), (cos(16/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 19]
type=explod
trigger1= !time && var(1)>=19
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(15/8.0*pi) * 6), (cos(15/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 20]
type=explod
trigger1= !time && var(1)>=20
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(2/8.0*pi) * 6), (cos(2/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 21]
type=explod
trigger1= !time && var(1)>=21
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(14/8.0*pi) * 6), (cos(14/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 22]
type=explod
trigger1= !time && var(1)>=22
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(3/8.0*pi) * 6), (cos(3/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 23]
type=explod
trigger1= !time && var(1)>=23
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(13/8.0*pi) * 6), (cos(13/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 24]
type=explod
trigger1= !time && var(1)>=24
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(4/8.0*pi) * 6), (cos(4/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 25]
type=explod
trigger1= !time && var(1)>=25
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(12/8.0*pi) * 6), (cos(12/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 26]
type=explod
trigger1= !time && var(1)>=26
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(5/8.0*pi) * 6), (cos(5/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 27]
type=explod
trigger1= !time && var(1)>=27
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(11/8.0*pi) * 6), (cos(11/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 28]
type=explod
trigger1= !time && var(1)>=28
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(6/8.0*pi) * 6), (cos(6/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 29]
type=explod
trigger1= !time && var(1)>=29
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(10/8.0*pi) * 6), (cos(10/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 30]
type=explod
trigger1= !time && var(1)>=30
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(7/8.0*pi) * 6), (cos(7/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 31]
type=explod
trigger1= !time && var(1)>=31
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(9/8.0*pi) * 6), (cos(9/8.0*pi) * -6)
accel= 0, .125
removetime=180

[State 1810, Ring 32]
type=explod
trigger1= !time && var(1)>=32
anim= 1800
sprpriority= 4
postype= p1
pos= 0, 0
vel= -1 + (sin(8/8.0*pi) * 6), (cos(8/8.0*pi) * -6)
accel= 0, .125
removetime=180



[State 1810, End]
type=removeexplod
trigger1= time>=180
[State 1810, End]
type=destroyself
trigger1= !numexplod


;====================<ANIMALS>====================
[Statedef 1900]
type=A
physics=N
movetype=I
anim= ifelse(random<500, 1900, 1901)
ctrl=0
sprpriority=-8

[State 1900, NHB]
type=nothitby
trigger1= 1
time=-1
value=SCA
ignorehitpause=1

[State 1900, Turn]
type=turn
trigger1= facing!=1

[State 1900, Accel]
type=veladd
trigger1= 1
y= .15

[State 1900, Vel]
type=velset
trigger1= 1
x= -.5
[State 1900, Vel]
type=velset
trigger1= !time
y= -3

[State 1900, End]
type=destroyself
trigger1= pos x!=[-240,240]
trigger2= screenpos y>=256


;====================<DEAD>====================
[Statedef 5150]
type=A
movetype=H
physics=N
anim=0
[State 5150, hurt]
type=lifeset
trigger1= 1
value=0
kill=1


;==========<COMMON ERASE>==========
[Statedef 10]
[State 10, End]
type=changestate
trigger1= 1
value=0
[Statedef 11]
[State 11, End]
type=changestate
trigger1= 1
value=0
[Statedef 12]
[State 12, End]
type=changestate
trigger1= 1
value=0

[Statedef 20]
[State 20, End]
type=changestate
trigger1= 1
value=0

[Statedef 40]
[State 40, End]
type=changestate
trigger1= 1
value=0
[Statedef 50]
[State 50, End]
type=changestate
trigger1= 1
value=0
[Statedef 51]
[State 51, End]
type=changestate
trigger1= 1
value=0
[Statedef 52]
[State 52, End]
type=changestate
trigger1= 1
value=0

[Statedef 45]
[State 45, End]
type=changestate
trigger1= 1
value=0

[Statedef 100]
[State 100, End]
type=changestate
trigger1= 1
value=0
[Statedef 105]
[State 105, End]
type=changestate
trigger1= 1
value=0


;==========<Initialize>==========
[Statedef 5900]
type=A

[State 5900, Var Reset]
type=varrangeset
trigger1= !roundsexisted
value=0
[State 5900, Var Reset]
type=varrangeset
trigger1= !roundsexisted
fvalue=0

[State 5900,end]
type=changestate
trigger1= 1
value=5901


;---Second---
[Statedef 5902]
type=A

[State 5902, Reset Time]
type=varset
trigger1= 1
var(2)=60
[State 5902, Reset Max Time]
type=varset
trigger1= 1
fvar(2)=fvar(1)

[State 5902, Reset Player 1 ID]
type=varset
trigger1= 1
var(5)=0
[State 5902, Reset Player 2 ID]
type=varset
trigger1= 1
var(6)=0

[State 5902, Reset Missed Rings]
type=varset
trigger1= 1
var(15)=0
[State 5902, Reset Perfect Bonus]
type=varset
trigger1= 1
var(17)=0

[State 5902,end]
type=changestate
trigger1= 1
value=190


;====================<INTRO>====================
[Statedef 190]
type=A
physics=N
movetype=I
anim=0
ctrl=0
[State 190, Intro]
type=assertspecial
trigger1= 1
flag=intro

[State 190, Intro Helper]
type=helper
trigger1= !time && !roundsexisted
helpertype=normal
stateno=590
ID=590
name="Intro Helper"
postype=left
ownpal=1

[State 190, End]
type=changestate
trigger1= !numhelper(590)
trigger2= time>=120
value=0


;====================<TIME OVER>====================
[Statedef 170]
physics=N
movetype=I
ctrl=1
[State 170, End]
type=changestate
trigger1= 1
value=5150

[Statedef 175]
physics=N
movetype=I
ctrl=1
[State 175, End]
type=changestate
trigger1= 1
value=5150


;====================<WIN>====================
[Statedef 180]
physics=N
movetype=I
ctrl=0

[State 180, End]
type=changestate
trigger1= 1
value=5150


;====================<ERASE HITS>====================
[Statedef 5000]
movetype=H
[State 5000, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5001]
movetype=H
[State 5001, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5002]
movetype=H
[State 5002, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5010]
movetype=H
[State 5010, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5020]
movetype=H
[State 5020, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5030]
movetype=H
[State 5030, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5050]
movetype=H
[State 5050, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5070]
movetype=H
[State 5070, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5080]
movetype=H
[State 5080, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)
[Statedef 5100]
movetype=H
[State 5100, override]
type=changestate
trigger1= 1
value=ifelse(ishelper,1090,2)


;===========================================================================
;===============================<-2 STATES>=================================
;===========================================================================
[Statedef -2]

[State -2, NotHitBy]
type=nothitby
trigger1= 1
time=-1
value=SCA,AA,AP,AT
ignorehitpause=1
[State -2, Life]
type=lifeset
trigger1= 1
trigger1= roundstate>=3 && life>1
value=lifemax

[State -2, Turn]
type=turn
trigger1= facing!=1

[State -2, Pos]
type=posset
trigger1= roundstate=2
x= ceil(enemynear,pos x + 80)
y= 0
[State -2, Pos]
type=posset
trigger1= roundstate=3
x= 160
y= 0

[State -2, No Push]
type=playerpush
trigger1= 1
value=0
[State -2, Not Bound]
type=screenbound
trigger1= roundstate>=2
value=0
movecamera=0,0

[State -2, No Push]
type=playerpush
trigger1= 1
value=0

[State -2, Ctrl]
type=changestate
trigger1= stateno && ctrl
value=0
[State -2, Ctrl]
type=ctrlset
trigger1= stateno && ctrl
value=0

[State -2, Assisting?]
type=varset
trigger1= numpartner
trigger1= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
var(4)= ifelse((ID > partner,ID), 2, 1)
[State -2, Assisting?]
type=varset
trigger1= !numpartner
var(4)= 0

[State -2, Player 1 ID]
type=varset
triggerall= numenemy=1
trigger1= !numpartner
trigger2= numpartner
trigger2= !(partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server")
trigger3= numpartner
trigger3= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
trigger3= ID < partner,ID
var(5)= enemy,ID
[State -2, Player 1 ID]
type=varset
triggerall= numenemy=2
trigger1= !numpartner
trigger2= numpartner
trigger2= !(partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server")
trigger3= numpartner
trigger3= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
trigger3= ID < partner,ID
var(5)= enemy(0),ID

[State -2, Player 2 ID]
type=varset
triggerall= numenemy>=2
trigger1= !numpartner
trigger2= numpartner
trigger2= !(partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server")
trigger3= numpartner
trigger3= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
trigger3= ID > partner,ID
var(6)= enemy(1),ID

[State -2, Time]
type=varadd
trigger1= fvar(2)>0
trigger1= roundstate=2
trigger1= stateno=2 || (stateno=[200,299])
fvar(2)= -.01666667

[State -2, Time]
type=varset
trigger1= fvar(1)>0
trigger1= fvar(2)>fvar(1)
fvar(2)= fvar(1)
[State -2, Time]
type=varset
trigger1= fvar(2)=(-1,0)
fvar(2)=0
[State -2, Time]
type=varset
trigger1= 1
var(2)=ceil(fvar(2))
[State -2, Time]
type=assertspecial
trigger1= alive
flag=timerfreeze

[State -2, Share Score]
type=varadd
trigger1= numpartner && var(4)=1
var(10)= partner,var(10)
[State -2, Share Score]
type=varset
trigger1= var(10)
trigger1= numpartner && var(4)=2
var(10)= 0

[State -2, Share Rings]
type=varadd
trigger1= numpartner && var(4)=1
var(13)= partner,var(13)
[State -2, Share Rings]
type=varset
trigger1= var(13)
trigger1= numpartner && var(4)=2
var(13)= 0

[State -2, Share Missed Rings]
type=varadd
trigger1= numpartner && var(4)=1
var(15)= partner,var(15)
[State -2, Share Missed Rings]
type=varset
trigger1= var(15)
trigger1= numpartner && var(4)=2
var(15)= 0

[State -2, Share Combo Timer]
type=varset
trigger1= numpartner && (var(4)=1 || var(4)=2)
trigger1= partner,var(11) > var(11)
var(11)= partner,var(11)

[State -2, Share Combo]
type=varadd
trigger1= numpartner && var(4)=1
var(12)= partner,var(12)
[State -2, Share Combo]
type=varset
trigger1= var(12)
trigger1= numpartner && var(4)=2
var(12)= 0

[State -2, Score Minimum]
type=varset
trigger1= var(10)<0
var(10)=0

[State -2, Add Up Total Score]
type=varset
trigger1= roundstate!=4
var(16)=0
[State -2, Perfect Bonus]
type=varset
trigger1= roundstate=4
trigger1= !var(16)
trigger1= !var(15) && var(13)>0 && fvar(1)>0
var(17)= ceil(fvar(1) * 500)
[State -2, Perfect Bonus]
type=varset
trigger1= roundstate=4
trigger1= !var(16)
trigger1= !var(15) && var(13)>0 && fvar(1)<0
var(17)= 50000
[State -2, Add Up Total Score]
type=varadd
trigger1= roundstate=4
trigger1= !var(16)
var(10)= (100 * var(13)) + var(17) + 0*(var(16):=1)

[State -2, Combo Timer]
type=varadd
trigger1= var(11)>0
var(11)= -1
[State -2, Combo Over]
type=varset
trigger1= var(11)<=0
trigger2= roundstate!=2
trigger3= playerIDexist(var(5))
trigger3= (playerID(var(5)),movetype=H) && (playerID(var(5)),time>=1)
trigger4= playerIDexist(var(6))
trigger4= (playerID(var(6)),movetype=H) && (playerID(var(6)),time>=1)
var(12)= 0

[State -2, Count Lost Rings]
type=varset
triggerall= var(13)
triggerall= roundstate=2
trigger1= playerIDexist(var(5))
trigger1= (playerID(var(5)),movetype=H) && (playerID(var(5)),time>=1)
trigger2= playerIDexist(var(6))
trigger2= (playerID(var(6)),movetype=H) && (playerID(var(6)),time>=1)
var(14)= var(13)

[State -2, Count Lost Rings]
type=varset
triggerall= var(13)
triggerall= roundstate=2
triggerall= var(4)=1 && numpartner
trigger1= playerIDexist(partner,var(5))
trigger1= (playerID(partner,var(5)),movetype=H) && (playerID(partner,var(5)),time>=1)
trigger2= playerIDexist(partner,var(6))
trigger2= (playerID(partner,var(6)),movetype=H) && (playerID(partner,var(6)),time>=1)
var(14)= var(13)

[State -2, Lose Rings]
type=helper
triggerall= var(13)
triggerall= roundstate=2
trigger1= playerIDexist(var(5))
trigger1= (playerID(var(5)),movetype=H) && (playerID(var(5)),time>=1)
helpertype=normal
stateno=1810
ID=1810
name="Lost Rings"
postype=left
pos= ceil(playerID(var(5)),pos x + 160), ceil(playerID(var(5)),pos y + playerID(var(5)),const(size.mid.pos.y))
ownpal=1

[State -2, Lose Rings]
type=helper
triggerall= var(13)
triggerall= roundstate=2
trigger1= playerIDexist(var(6))
trigger1= (playerID(var(6)),movetype=H) && (playerID(var(6)),time>=1)
helpertype=normal
stateno=1810
ID=1810
name="Lost Rings"
postype=left
pos= ceil(playerID(var(6)),pos x + 160), ceil(playerID(var(6)),pos y + playerID(var(6)),const(size.mid.pos.y))
ownpal=1

[State -2, Lose Rings]
type=helper
triggerall= var(13)
triggerall= roundstate=2
triggerall= var(4)=1 && numpartner
trigger1= playerIDexist(partner,var(6))
trigger1= (playerID(partner,var(6)),movetype=H) && (playerID(partner,var(6)),time>=1)
helpertype=normal
stateno=1810
ID=1810
name="Lost Rings"
postype=left
pos= ceil(playerID(partner,var(6)),pos x + 160), ceil(playerID(partner,var(6)),pos y + playerID(partner,var(6)),const(size.mid.pos.y))
ownpal=1

[State -2, Rings Lost]
type=varset
triggerall= var(13)
triggerall= roundstate=2
trigger1= playerIDexist(var(5))
trigger1= (playerID(var(5)),movetype=H) && (playerID(var(5)),time>=1)
trigger2= playerIDexist(var(6))
trigger2= (playerID(var(6)),movetype=H) && (playerID(var(6)),time>=1)
trigger3= var(4)=1
trigger3= numpartner
trigger3= playerIDexist(partner,var(6))
trigger3= (playerID(partner,var(6)),movetype=H) && (playerID(partner,var(6)),time>=1)
var(13)= 0 * (var(15):=(var(15) + var(14)))

[State -2, Assert]
type=assertspecial
triggerall= alive
trigger1= !numpartner
trigger2= numpartner
trigger2= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
trigger3= numpartner
trigger3= partner,name="SS1 Bonus" && partner,authorname="Phantom.of.the.Server"
flag=nokoslow

[State -2, Display]
type=helper
triggerall= !numhelper(500)
trigger1= !numpartner
trigger2= numpartner
trigger2= partner,name="Sky Chase" && partner,authorname="Phantom.of.the.Server"
trigger2= ID < partner,ID
helpertype=normal
stateno=ifelse(roundstate=4, 580, 500)
ID=500
name="Display"
postype=left
pos=160,0
pausemovetime=2147483647
supermovetime=2147483647
ownpal=1

[State -2, Airplane 1]
type=helper
trigger1= !numhelper(900)
trigger1= playerIDexist(var(5))
helpertype=normal
stateno=900
ID=900
name="Tails Airplane"
postype=left
ownpal=1
[State -2, Airplane 2]
type=helper
trigger1= !numhelper(910)
trigger1= playerIDexist(var(6))
helpertype=normal
stateno=910
ID=910
name="Amy Airplane"
postype=left
ownpal=1

[State -2, Debug]
type=displaytoclipboard
trigger1= 1
text="Score=%d Time=%d Combo=%d Rings Missed=%d NumHelper=%d"
params=var(10), var(2), var(12), var(15), numhelper
ignorehitpause=1

[State -2, Debug]
type=displaytoclipboard
trigger1= var(4)=2
text="Assisting..."
ignorehitpause=1

[State -2, Debug]
type=appendtoclipboard
trigger1= 1
text= "\nBy PotS - http://www.mugenguild.com/pots/"
ignorehitpause=1

;====================<BALKIRY>====================
;---FLYING NORMALLY---
[Statedef 1000]
type=A
physics=N
movetype=A
anim=1000
ctrl=0
sprpriority=-10

[State 1001, Smoke]
type=explod
trigger1= movehit = 1
anim= 1090
sprpriority= -8
postype= p1
pos= 0, 0
vel= (-.5 * facing), 0
scale= 0.60, 0.60
facing= facing
ownpal= 1

[State 1000, Override]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1090
ignorehitpause=1
[State 1000, HB]
type=hitby
trigger1= 1
time=-1
value=SCA,AA,AP
ignorehitpause=1

[State 1000, Jet]
type=explod
trigger1= !numexplod(1005)
anim=1005
ID=1005
sprpriority=-10
postype=p1
pos=-28,2
scale=1,1
bindtime=-1
removetime=300

[State 1000, Vel]
type=velset
trigger1= 1
x= 3

[State 1000, Hit]
type=hitdef
trigger1= !time
trigger1= !movecontact && !movereversed
attr = A,NA
hitflag = MA-
projhitanim = 1090
guardflag =
priority = 1, Miss
damage = 0, 0
getpower = 0, 0
givepower = 0, 0
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 16
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -5.0, -7.5
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
fall.recover = 1
fall.recovertime = 0
forcestand = 0
hitsound = S1,0
guardsound = 6, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, 0
palfx.time = 16
palfx.add = 128,128,128
palfx.sinadd= 128,128,128,4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p1sprpriority = -10

[State 1000, Destroyself]
type = destroyself
trigger1 = movehit = 1

[State 1000, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-208) || (facing=1 && pos x>=208)
value= 1091


;---FLYING FAST---
[Statedef 1001]
type=A
physics=N
movetype=A
anim=1000
ctrl=0
sprpriority=-10

[State 1001, Smoke]
type=explod
trigger1= movehit = 1
anim= 1090
sprpriority= -8
postype= p1
pos= 0, 0
vel= (-.5 * facing), 0
scale= 0.60, 0.60
facing= facing
ownpal= 1

[State 1001, Override]
type=hitoverride
trigger1= 1
attr=SCA,AA,AP,AT
time=-1
stateno=1090
ignorehitpause=1

[State 1001, HB]
type=hitby
trigger1= 1
time=-1
value=SCA,AA,AP
ignorehitpause=1

[State 1001, Jet]
type=explod
trigger1= !numexplod(1005)
anim=1005
ID=1005
sprpriority=-10
postype=p1
pos=-28,2
scale=1,1
bindtime=-1
removetime=300

[State 1001, Vel]
type=velset
trigger1= 1
x= 5

[State 1001, Hit]
type=hitdef
trigger1= !time
trigger1= !movecontact && !movereversed
attr = A,NA
hitflag = MA-
guardflag =
priority = 1, Miss
damage = 0, 0
getpower = 0, 0
givepower = 0, 0
projhitanim = 1090
pausetime = 0, 12
guard.pausetime = 0, 12
animtype = Hard
air.animtype = Back
fall.animtype = Back
ground.type = High
air.type = Low
ground.hittime = 16
ground.slidetime = 16
guard.hittime = 16
air.hittime = 16
ground.velocity = -12.0, 0
ground.cornerpush.veloff = 0
guard.velocity = 0
guard.cornerpush.veloff = 0
air.velocity = -5.0, -7.5
air.cornerpush.veloff = 0
yaccel = .5
fall = 0
fall.recover = 1
fall.recovertime = 0
forcestand = 0
hitsound = S1,0
guardsound = 6, 0
sparkno = 0
guard.sparkno = 40
sparkxy = -10, 0
palfx.time = 16
palfx.add = 128,128,128
palfx.sinadd= 128,128,128,4
envshake.time = 14
envshake.ampl = 4
envshake.freq = 120
p1sprpriority = -10

[State 1000, Destroyself]
type = destroyself
trigger1 = movehit = 1

[State 1001, End]
type=changestate
trigger1= pos x!=[-320,320]
trigger2= (facing=-1 && pos x<=-208) || (facing=1 && pos x>=208)
value= 1091


