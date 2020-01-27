win=false;
enemy=noone;
sub=0;
subchanger=0;
choice=0;

var inst=instance_create_layer(0,0,"Instances",objBattleBackground);
with(inst) {
	alpha=0.7; amplitude=3; effect=0; speedx=0.5; speedy=0.8;
} var inst=instance_create_layer(0,0,"Instances",objBattleBackground);
with(inst) {
	effect=3; image_speed=0.05; speedx=1.1;
}

/*List of things that can be affected below and their defaults

back = spr_battle_bckg_1;               // Sprite index
alpha = 1;              // Sprite transparency
phaserate = 1;          // Speed of wave movement
frequency = 50;         // Density of waves
amplitude = 5;          // Intensity of waves
offsetx = 100;          // Horizontal offset
offsety = 55;           // Vertical offset
speedx = 2.5;           // Horizontal speed
speedy = -0.5;          // Vertical speed
sourcex = 0;
sourcey = 0;
effect = 3;             // 0: Sine, 1: VerComp, 2: HorComp (incomplete) 3: Sine+VerComp
scanline = 0;           // Scanline effect. 0: None, 1: Draw even lines, 2: Draw odd lines
image_speed = 0.1;      // Animation speed
*/