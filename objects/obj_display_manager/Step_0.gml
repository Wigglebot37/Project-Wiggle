/*if(keyboard_check_pressed(ord("O"))) {
	zoom++;
	if(zoom>max_zoom) zoom=1;
	game_width=ideal_width*zoom;
	game_height=ideal_height*zoom;
	window_set_size(game_width,game_height);
	surface_resize(application_surface,game_width,game_height);
	if(instance_exists(obj_battle_bckg)) {
		if(surface_exists(obj_battle_bckg.surf)) surface_resize(obj_battle_bckg.surf,game_width,game_height);
	}
	scalar=zoom;
	alarm[0]=1;
}*/