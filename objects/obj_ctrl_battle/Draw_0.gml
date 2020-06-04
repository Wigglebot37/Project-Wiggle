if(start_battle && surface_exists(transsurf)) {
	surface_set_target(transsurf);
	DissolveShader(spr_battle_trans,image_index,0,0,fade);
	surface_reset_target();
	draw_surface(transsurf,obj_camera.x-view_width/2,obj_camera.y-view_height/2);
}