if(instance_number(obj_textevent)>1 or instance_number(obj_textbox)>0){ instance_destroy(); exit; }

//-----------Customise (FOR USER)
myPitch			= 1;
myTextCol		= c_white;
myPortrait		= -1;
myFont			= FONT_NORM;
myName			= "Noone";

//-----------Setup (LEAVE THIS STUFF)
active_textbox   = noone;
reset_dialogue_defaults();