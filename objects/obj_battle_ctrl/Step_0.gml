if(input_revert || win) {
	if(win) enemy.flash=1;
	with(obj_game) {
		if(!transitionbool) {
			audio_stop_all();
			pfA=stored_dir;
			runbool=false;
			enemy=noone;
			if(obj_battle_ctrl.win) win=true;
			end_battle=true;
			spawnRoom=rm_town;
			transitionbool=true;
		}
	}
	win=false;
}
if(obj_game.end_battle) {
	instance_destroy(enemy);
	enemy=noone;
}

if(input_right_perm-input_left_perm!=0) audio_play_sound(snd_moveselect,50,false);
choice+=input_right_perm-input_left_perm;
if(choice==0 && input_down_perm) { choice=2; audio_play_sound(snd_moveselect,50,false); }
else if(choice==2 && input_up_perm) { choice=0; audio_play_sound(snd_moveselect,50,false); }
else if(choice==1 && input_down_perm) { choice=3; audio_play_sound(snd_moveselect,50,false); }
else if(choice==3 && input_up_perm) { choice=1; audio_play_sound(snd_moveselect,50,false); }
if(choice<0) choice=4;
else if(choice>4) choice=0;

subchanger+=0.2;
if(subchanger==1.2) {
	sub++;
	subchanger=0;
}