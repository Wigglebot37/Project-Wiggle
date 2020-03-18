///@description cutscene_room_transition
///@arg targetroom
///@arg targetx
///@arg targety
///@arg pfafter

with(obj_game) {
	if(!transitionbool) {
		spawnRoom=argument0;
		spawnX=argument1;
		spawnY=argument2;
		pfA=argument3;
		transitionbool=true;
	}
}