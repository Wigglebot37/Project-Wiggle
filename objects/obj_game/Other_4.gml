///@description Spawn point
if(spawnRoom==-1) exit;
if(spawnRoom!=rm_battlescreen && object_exists(ev)) {
	ev.x=spawnX;
	ev.y=spawnY;
}