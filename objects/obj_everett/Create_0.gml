//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_evrtdn;
myPitch				= 1;
myFont				= FONT_NORM;
myName				= "Everett";

invincible=false;
invc_ctdn=3;
ev_alpha=1;
empty=false;
running=false;
ready=false;
ready2=0;
spd=0;
walk_spd=1;
run_spd=2;
hinput=0;
vinput=0;
prepress=false;

img_spd=8;
idleadd=0;
randombool=false;
randomnum=-1;
diagfacing=false;
diagtouch=false;
diagtouchprev=false;
x1=x;
y1=y;
x2=x;
y2=y;
flash=0;

enddir=-1;
dir=dir_down;

global.ev=self;
audio_play_sound(snd_beach,100,true);
audio_sound_gain(snd_beach,0,0);
maxdist=300;

tran=obj_transition;
active_textbox=noone;

zswitch=false;
zspeed=2;
zgrav=0;
z=0;
depth=-y;