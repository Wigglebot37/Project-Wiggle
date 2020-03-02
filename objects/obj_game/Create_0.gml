globalvar game_width,game_height,pause,transition_sound;

game_width=window_get_width();
game_height=window_get_height();
pause=false;

display_set_gui_size(game_width,game_height);

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sounds);

audio_group_set_gain(audiogroup_sounds,0.75,0);
audio_group_set_gain(audiogroup_music,0.75,0);
audio_master_gain(0.75);

pal_swap_init_system(shd_pal_swapper);

up_pres=false;
left_pres=false;
down_pres=false;
right_pres=false;

end_battle=false;
stored_dir=0;
trany1=-4;
trany2=-4;
blackA=0;
end_tran=false;
img_spd=0;
flashct=0;

enemy=noone;

main_menu_transition=false;
spawnRoom=-1;
transitionbool=false;
spawnX=0;
spawnY=0;
pfA=0;
transition_sound=snd_select;

ev=obj_everett;

runbool=false;

globalvar transinst;
// Create game font from sprite
mapstring=" 0123456789AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz.!?,'()&:;/%";
globalvar FONT_NORM,FONT_OUTLINE,Flavor;
FONT_NORM=font_add_sprite_ext(spr_fontsmall,mapstring,true,2);
FONT_OUTLINE=font_add_sprite_ext(spr_fontnormoutline,mapstring,true,2);
draw_set_font(FONT_NORM);

enum flavor {
	vanilla=0,
	cantaloupe=1,
	strawberry=2,
	blueberry=3,
	grape=4,
	pineapple=5,
	mint=6,
	blackberry=7
}
Flavor=flavor.vanilla;

enum txtfx {
	normal=0,
	shake=1,
	wave=2,
	col_shift=3,
	wave_col_shift=4,
	spin=5,
	pulse=6,
	flicker=7
}

// Button Maps
globalvar key_revert,key_interact,key_up,key_left,key_down,key_right,key_pause,key_enter;
// Key Presses
globalvar input_enter,input_up,input_left,input_down,input_right,input_up_perm,input_left_perm,input_down_perm,input_right_perm,
	input_up_pres,input_left_pres,input_down_pres,input_right_pres,input_ready,input_revert,input_run, 
	input_interact,input_pause,dir_up, dir_upright, dir_right, dir_downright, dir_down, dir_downleft, dir_left, dir_upleft;

gamepad=false;
win=false;
stored_inst=noone;

dir_up=90;
dir_upright=45;
dir_right=0;
dir_downright=315;
dir_down=270;
dir_downleft=225;
dir_left=180;
dir_upleft=135;

key_revert=ord("X");
key_interact=ord("C");
key_up=vk_up;
key_left=vk_left;
key_down=vk_down;
key_right=vk_right;
key_pause=vk_escape;
key_enter=vk_enter;