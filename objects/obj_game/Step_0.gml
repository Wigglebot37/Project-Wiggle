/// @description Gui/Global dimensions
if(keyboard_check_pressed(vk_f4)) {
	window_set_fullscreen(!window_get_fullscreen());
}

if(keyboard_check_pressed(ord("R"))) game_restart();

game_width=window_get_width();
game_height=window_get_height();

display_set_gui_size(game_width,game_height);

gamepad=false;
var maxpads=gamepad_get_device_count(); for(var i=0; i<maxpads; i++) {
    if(gamepad_is_connected(i)) {
		key_revert=gp_face2;
		key_interact=gp_face1;
		key_pause=gp_start;
		key_enter=gp_face1;
		
		var haxis = gamepad_axis_value(0, gp_axislh);
		var vaxis = gamepad_axis_value(0, gp_axislv);
		
		input_up=false; input_left=false; input_down=false; input_right=false;
		input_right_perm=false; input_right_pres=false; input_up_perm=false;
		input_up_pres=false; input_left_perm=false; input_left_pres=false;
		input_down_perm=false; input_down_pres=false;
		if(haxis>0.5) input_right=true;
		else if(haxis<-0.5) input_left=true;
		if(vaxis>0.5) input_down=true;
		else if(vaxis<-0.5) input_up=true;
		
		if(haxis<0.5) right_pres=false;
		if(haxis>-0.5) left_pres=false;
		if(vaxis<0.5) down_pres=false;
		if(vaxis>-0.5) up_pres=false; 
		
		if(haxis>=0.5 && !right_pres) {
			input_right_perm=true; input_right_pres=true; right_pres=true;
		} else if(haxis<=-0.5 && !left_pres) {
			input_left_perm=true; input_left_pres=true; left_pres=true;
		} else if(vaxis<=-0.5 && !up_pres) {
			input_up_perm=true; input_up_pres=true; up_pres=true;
		} else if(vaxis>=0.5 && !down_pres) {
			input_down_perm=true; input_down_pres=true; down_pres=true;
		}
		
		input_enter=gamepad_button_check_pressed(i,key_enter);
		input_ready=gamepad_button_check(i,key_revert);
		input_revert=gamepad_button_check_pressed(i,key_revert);
		input_run=gamepad_button_check_released(i,key_revert);
		input_interact=gamepad_button_check_pressed(i,key_interact);
		input_pause=gamepad_button_check_pressed(i,key_pause);
		
		gamepad=true;
	}
}

if(!gamepad) {
	input_enter=keyboard_check_pressed(key_enter);
	input_up=keyboard_check(key_up);
	input_left=keyboard_check(key_left);
	input_down=keyboard_check(key_down);
	input_right=keyboard_check(key_right);
	input_up_perm=keyboard_check_pressed(vk_up);
	input_left_perm=keyboard_check_pressed(vk_left);
	input_down_perm=keyboard_check_pressed(vk_down);
	input_right_perm=keyboard_check_pressed(vk_right);
	input_up_pres=keyboard_check_pressed(key_up);
	input_left_pres=keyboard_check_pressed(key_left);
	input_down_pres=keyboard_check_pressed(key_down);
	input_right_pres=keyboard_check_pressed(key_right);
	input_ready=keyboard_check(key_revert);
	input_revert=keyboard_check_pressed(key_revert);
	input_run=keyboard_check_released(key_revert);
	input_interact=keyboard_check_pressed(key_interact);
	input_pause=keyboard_check_pressed(key_pause);
}

if(room==rm_0) room_goto(rm_start_menu);