///@description cutscene_end_action

scene++;
if(scene>array_length_1d(scene_info)-1) {
	cutscene_end=true;
	exit;
}

event_perform(ev_other,ev_user0);