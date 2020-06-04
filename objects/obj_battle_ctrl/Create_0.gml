win=false;
enemy=noone;
sub=0;
subchanger=0;
choice=0;

background1=instance_create_layer(0,0,"Instances",obj_battle_bckg);
with(background1) {
	back=spr_back_wavy; effect=0; image_speed=0.05;
} background2=instance_create_layer(0,0,"Instances",obj_battle_bckg);
with(background2) {
	back=spr_back_rain; effect=1; speedy=0.8;
}
/*List of things that can be affected below and their defaults

back = spr_back_dmnd;   // Sprite index
alpha = 1;              // Sprite transparency
phaseoffset = 0;        // Increased by phaserate every step to create wave movement 
phaserate = 1;          // Speed of wave movement
frequency = 50;         // Density of waves
amplitude = 5;         // Intensity of waves
offsetx = 0;          // Horizontal offset
offsety = 0;           // Vertical offset
speedx = 0;           // Horizontal speed
speedy = 0;          // Vertical speed
tr_offsetx = 0;         // Increased by speedx every step to create translation
tr_offsety = 0;         // Increased by speedy every step to create translation
sourcex = 0;
sourcey = 0;
effect = 0;             // 0: Sine, 1: VerComp, 2: HorComp (incomplete) 3: Sine+VerComp
scanline = 0;           // Scanline effect. 0: None, 1: Draw even lines, 2: Draw odd lines
image_speed = 0.1;      // Animation speed
*/