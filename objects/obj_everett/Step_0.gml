/// @description Collision
if(keyboard_check_pressed(vk_space)) flash=1;
//var beachdist=distance_to_object(instance_nearest(x,y,obj_wall_beach));
//if(beachdist<maxdist) audio_sound_gain(snd_beach,(maxdist-beachdist)/maxdist,0);

if(obj_pause_menu.end_pause || obj_game.end_tran) { image_speed=img_spd; obj_pause_menu.end_pause=false; obj_game.end_tran=false;
	if(!running && ready2==1) {running=true; ready=false; ready2=0;} else {ready=false; ready2=0;} }

if(!pause && !obj_game.transitionbool && active_textbox==noone) {
	// Getting ready to run
	if(!running && input_ready) ready=true;
	if(ready && ready2<1) ready2+=0.04;

	// Running boolean
	if(input_run && ready2==1) {
		ready=false;
		running=true;
	} else if(input_run) {
		ready=false;
		ready2=0;
	}

	if(input_revert && running) {
		running=false;
	}
}

// Changing speeds
if(!instance_exists(obj_cutscene)) {
	if(running) {
		spd=run_spd; ready2=0; obj_camera.factor=10;
	} else {
		spd=walk_spd; obj_camera.factor=20;
	}
}

if(!instance_exists(obj_cutscene) && !obj_game.transitionbool && active_textbox==noone && !pause && !ready) {
	if(!running && hinput==0 && vinput==0) prepress=false;
	else prepress=true;
	
	hinput=(input_right-input_left)*spd;
	vinput=(input_down-input_up)*spd;
	
	if(hinput!=0 || vinput!=0) {
		dir=point_direction(x,y, x+hinput, y+vinput);
	} else if(!running) {
		hinput=0;
		vinput=0;
	}
	#region // Diagonal wall collisions
	diagtouchprev=diagtouch;
	/*
	obj_walldiag# as coordinated below (obj_walldiag1 is simply written as obj_walldiag
	
			  /|\
		(1)	 / | \  (4)
			/__|__\
			\  |  /
		(2)	 \ | /  (3)
			  \|/
	*/
	if(!ready) {
		if(place_meeting(x+1,y+1,obj_walldiag)) {
			if(dir==dir_right) {
				enddir=dir_right; dir=dir_upright; if(!diagtouch) diagtouch=true;
			} else if(dir==dir_down) {
				enddir=dir_down; dir=dir_downleft; if(!diagtouch) diagtouch=true;
			}
		} else if(place_meeting(x+1,y-1,obj_walldiag2)) {
			if(dir==dir_right) {
				enddir=dir_right; dir=dir_downright; if(!diagtouch) diagtouch=true;
			} else if(dir==dir_up) {
				enddir=dir_up; dir=dir_upleft; if(!diagtouch) diagtouch=true;
			}
		} else if(place_meeting(x-1,y-1,obj_walldiag3)) {
			if(dir==dir_left) {
				enddir=dir_left; dir=dir_downleft; if(!diagtouch) diagtouch=true;
			} else if(dir==dir_up) {
				enddir=dir_up; dir=dir_upright; if(!diagtouch) diagtouch=true;
			}
		} else if(place_meeting(x-1,y+1,obj_walldiag4)) {
			if(dir==dir_left) {
				enddir=dir_left; dir=dir_upleft; if(!diagtouch) diagtouch=true;
			} else if(dir==dir_down) {
				enddir=dir_down; dir=dir_downright; if(!diagtouch) diagtouch=true;
			}
		} else if(diagtouch) diagtouch=false;
	} //Ends transitionbool statement
	#endregion
}
#region //Room transition collision check
var inst=instance_place(x, y, tran);
if (inst!=noone) {
	if(inst.pfB1==dir_up) {
		inst.pfB2=dir_upleft; inst.pfB3=dir_upright;
	} else if(inst.pfB1==dir_left) {
		inst.pfB2=dir_upleft; inst.pfB3=dir_downleft;
	} else if(inst.pfB1==dir_right) {
		inst.pfB2=dir_upright; inst.pfB3=dir_downright;
	} else if(inst.pfB1==dir_down) {
		inst.pfB2=dir_downleft; inst.pfB3=dir_downright;
	} if(dir==inst.pfB1 || dir==inst.pfB2 || dir==inst.pfB3) {
		spd=0;
		img_spd=image_speed;
		image_index=1;
		with(obj_game) {
			if(!transitionbool) {
				spawnRoom=inst.targetRoom;
				spawnX=inst.targetX;
				spawnY=inst.targetY;
				pfA=inst.pfA;
				transitionbool=true;
			}
		}
	}
}
#endregion
#region //Cutscene Trigger collision check
// One-use Trigger
if(!instance_exists(obj_cutscene)) {
	var cut_inst=instance_place(x,y,obj_trigger_par);
	if(cut_inst!=noone) {
		running=false;
		with(cut_inst) {
			create_cutscene(t_scene_info);
			if(cut_inst.object_index==obj_trigger) instance_destroy();
		}
		cut_inst=noone;
	}
}
#endregion
#region //Attempting diagonal movement along straight walls
if(dir==dir_upright) {
	if(place_meeting(x+spd,y,obj_wall) && !place_meeting(x,y-spd,obj_wall)
		&& !place_meeting(x+spd,y,obj_walldiag)) {
		dir=dir_up; if(running) { running=false; ready=false; ready2=0; }
	} else if(!place_meeting(x+spd,y,obj_wall) && place_meeting(x,y-spd,obj_wall)
		&& !place_meeting(x,y-spd,obj_walldiag3)) {
		dir=dir_right; if(running) { running=false; ready=false; ready2=0; }
	}
} else if(dir==dir_upleft) {
	if(place_meeting(x-spd,y,obj_wall) && !place_meeting(x,y-spd,obj_wall)
		&& !place_meeting(x-spd,y,obj_walldiag4)) {
		dir=dir_up; if(running) { running=false; ready=false; ready2=0; }
	} else if(!place_meeting(x-spd,y,obj_wall) && place_meeting(x,y-spd,obj_wall)
		&& !place_meeting(x,y-spd,obj_walldiag2)) {
		dir=dir_left; if(running) { running=false; ready=false; ready2=0; }
	}
} else if(dir==dir_downright) {
	if(place_meeting(x+spd,y,obj_wall) && !place_meeting(x, y+spd, obj_wall)
		&& !place_meeting(x+spd,y,obj_walldiag2)) {
		dir=dir_down; if(running) { running=false; ready=false; ready2=0; }
	} else if(!place_meeting(x+spd,y,obj_wall) && place_meeting(x,y+spd,obj_wall)
		&& !place_meeting(x,y+spd,obj_walldiag4)) {
		dir=dir_right; if(running) { running=false; ready=false; ready2=0; }
	}
} else if(dir==dir_downleft) {
	if(place_meeting(x-spd,y,obj_wall) && !place_meeting(x,y+spd,obj_wall)
		&& !place_meeting(x-spd,y,obj_walldiag3)) {
		dir=dir_down; if(running) { running=false; ready=false; ready2=0; }
	} else if(!place_meeting(x-spd,y,obj_wall) && place_meeting(x,y+spd,obj_wall)
		&& !place_meeting(x,y+spd,obj_walldiag)) {
		dir=dir_left; if(running) { running=false; ready=false; ready2=0; }
	}
}
#endregion
#region //Makes it so walking sprite does not animate during collision
if((place_meeting(x, y-spd, obj_wall) && dir==dir_up)
|| (place_meeting(x, y+spd, obj_wall) && dir==dir_down)
|| (place_meeting(x+spd, y, obj_wall) && dir==dir_right)
|| (place_meeting(x-spd, y, obj_wall) && dir==dir_left)
|| (place_meeting(x+spd, y, obj_wall) && place_meeting(x, y-spd, obj_wall) && dir==dir_upright)
|| (place_meeting(x-spd, y, obj_wall) && place_meeting(x, y-spd, obj_wall) && dir==dir_upleft)
|| (place_meeting(x+spd, y, obj_wall) && place_meeting(x, y+spd, obj_wall) && dir==dir_downright)
|| (place_meeting(x-spd, y, obj_wall) && place_meeting(x, y+spd, obj_wall) && dir==dir_downleft)
|| (place_meeting(x+spd,y+spd,obj_walldiag) && dir==dir_downright)
|| (place_meeting(x+spd,y-spd,obj_walldiag2) && dir==dir_upright)
|| (place_meeting(x-spd,y-spd,obj_walldiag3) && dir==dir_upleft)
|| (place_meeting(x-spd,y+spd,obj_walldiag4) && dir==dir_downleft)) {
	image_index=1;
	spd=0;
	running=false;
	ready=false;
	ready2=0;
} #endregion
#region //Sprite Changes
if(running) sprite_index=spr_trplayer;
else if(!ready && ready2<1 && idleadd==0) {
	image_speed=1; if(image_index>=4) image_index=0; randomnum=-1;
}
if(!running) {
	switch(dir) {
		case dir_up:
			if(ready2==1) sprite_index=spr_evrtuprdy2;
			else if(ready) sprite_index=spr_evrtuprdy;
			else sprite_index=spr_evrtup;
			break;
		case dir_upright:
			if(ready2==1) sprite_index=spr_evrtuprtrdy2;
			else if(ready) sprite_index=spr_evrtuprtrdy;
			else sprite_index=spr_evrtuprt;
			break;
		case dir_right:
			if(ready2==1) sprite_index=spr_evrtrtrdy2;
			else if(ready) sprite_index=spr_evrtrtrdy;
			else sprite_index=spr_evrtrt;
			break;
		case dir_downright:
			if(ready2==1) sprite_index=spr_evrtdnrtrdy2;
			else if(ready) sprite_index=spr_evrtdnrtrdy;
			else sprite_index=spr_evrtdnrt;
			break;
		case dir_down:
			if(ready2==1) sprite_index=spr_evrtdnrdy2;
			else if(ready) sprite_index=spr_evrtdnrdy;
			else sprite_index=spr_evrtdn;
			break;
		case dir_downleft:
			if(ready2==1) sprite_index=spr_evrtdnlftrdy2;
			else if(ready) sprite_index=spr_evrtdnlftrdy;
			else sprite_index=spr_evrtdnlft;
			break;
		case dir_left:
			if(ready2==1) sprite_index=spr_evrtlftrdy2;
			else if(ready) sprite_index=spr_evrtlftrdy;
			else sprite_index=spr_evrtlft;
			break;
		case dir_upleft:
			if(ready2==1) sprite_index=spr_evrtuplftrdy2;
			else if(ready) sprite_index=spr_evrtuplftrdy;
			else sprite_index=spr_evrtuplft;
			break;
	}
#endregion
#region //Idling
	if(hinput==0 && vinput==0 && !ready && !running && !instance_exists(obj_cutscene)) {
		if(active_textbox!=noone) {
			image_index=1;
			idleadd=0;
		} else if(!pause && !obj_game.transitionbool) {
			if(idleadd<1) {
				idleadd+=(1/(60*6)); image_index=1;
			} else {
				if(randomnum<0) randombool=true;
				if(randombool) {
					randomize();
					randomnum=irandom(2);
					randombool=false;
				} image_speed=.3; switch(randomnum) {
					case 0: if(image_index<4 || image_index>=8) image_index=4; break;
					case 1: if(image_index<8 || image_index>=16) image_index=8; break;
					case 2: if(image_index<16 || image_index>=20) image_index=16; break;
				}
			}
		}	
	} else if(hinput!=0 || vinput!=0) idleadd=0;
}
#endregion
#region //Invincibility
if(invincible) {
	if(invc_ctdn>0) {
		invc_ctdn-=0.02;
		if(ev_alpha==0) ev_alpha=1;
		else if(ev_alpha==1) ev_alpha=0;
	}
	else {
		ev_alpha=1; invc_ctdn=3; invincible=false;
	}
}
#endregion
#region //Enemy Collision
var inst=instance_place(x,y,obj_par_enemy);
if(inst!=noone && !invincible) {
	running=false;
	with(obj_game) {
		if(!transitionbool) {
			obj_game.stored_inst=inst;
			stored_dir=ev.dir;
			spawnX=ev.x; spawnY=ev.y;
			spawnRoom=inst.targetRoom;
			enemy=inst.object_index;
			transitionbool=true;
		}
	}
}
#endregion

if(running && diagtouchprev && !diagtouch && hinput==0 && vinput==0) dir=enddir;
depth=-y;
direction=dir;
speed=spd;
if((hinput!=0 || vinput!=0) && !prepress) image_index=2;
if(obj_pause_menu.start_pause) { img_spd=image_speed; obj_pause_menu.start_pause=false; }
if(pause || obj_game.transitionbool) { image_speed=0; speed=0; }
if((!running && hinput==0 && vinput==0 && !instance_exists(obj_cutscene)) || ready || ready2) speed=0;