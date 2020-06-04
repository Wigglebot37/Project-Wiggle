if(fade<1 && start_battle) fade+=0.01;

if(start_battle && !surface_exists(transsurf)) transsurf=surface_create(view_width,view_height);

if(fade==1 && !fadetrigger) {
	/*var gm=obj_game;
	gm.stored_inst=instance;
	gm.stored_dir=stored_direction;
	gm.spawnX=spX; spawnY=spY;
	gm.spawnRoom=spRoom;
	gm.enemy=enemy;*/
	//gm.transitionbool=true;
	alarm[0]=30;
	fadetrigger=true;
}

if(room==rm_battlescreen) {
	if(fade2>0) fade2-=0.004;
	var lay_id=layer_get_id("Background");
	var back_id=layer_background_get_id(lay_id);
	layer_background_alpha(back_id,fade2);
}