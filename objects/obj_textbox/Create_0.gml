talk=1;
yy=game_height-6*scalary;
yy2=0;
yp=game_height;
stop_dialogue=false;
/*
font_pixelH=shader_get_uniform(shd_outline,"pixelH");
font_pixelW=shader_get_uniform(shd_outline,"pixelW");
col_r=shader_get_uniform(shd_outline,"_r");
col_g=shader_get_uniform(shd_outline,"_g");
col_b=shader_get_uniform(shd_outline,"_b");
font_texelH=texture_get_texel_height(sprite_get_texture(spr_reference,0));
font_texelW=texture_get_texel_width(sprite_get_texture(spr_reference,0));
*/

input_up=keyboard_check_pressed(ord("W"));
input_down=keyboard_check_pressed(ord("S"));
input_right=keyboard_check_pressed(ord("D"));
input_left=keyboard_check_pressed(ord("A"));

cam=obj_camera;
boxheight=78; //78 for 2 lines, 106 for 3 lines
boxstart=game_height-(boxheight*scalary);
namestart=boxstart-(40*scalary);
// Where the box will spawn in at in the y position (x is just 0)

if(instance_number(obj_textevent)>1 or instance_number(obj_textbox)>1){ instance_destroy(); exit; }

choice_snd_effect	= snd_moveselect;
select_snd_effect	= snd_select;

default_col			= c_white;
choice_col			= c_yellow;
select_col			= c_orange;
name_col			= c_orange;

priority_snd_effect = 5;

//-----------Setup (LEAVE THIS STUFF)
#region
speaker			= noone;

char			= 0;
charCount		= 0;
charCount_f		= 0;
text_speed		= 0;
text_speed_c	= 0;
page			= 0;
str_len			= -1;
textpause		= false;
chosen			= false;
choice			= 0;

creator			= noone;
type			= 0;
text			= -1;
text_NE			= -1;
breakpoints		= -1;
nextline		= 0;
text_col		= c_white;

portrait		= 1;
pitch			= 1;
font			= 1;

charSize		= 1;
stringHeight	= 1;

//---------------------Effect variables

t			= 0;
amplitude	= 4;
freq		= 2;

#endregion

subchanger=0;
sub=0;
fntsize=28;
textwidthlmt=game_width-16*scalarx;
xval=46;