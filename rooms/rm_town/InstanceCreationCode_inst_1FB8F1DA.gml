event_inherited();

t_scene_info=[
	[cutscene_move_character,obj_everett,575,864,false,1],
	[cutscene_play_sound,snd_dooropen,50,false],
	[cutscene_instance_destroy,obj_everett],
	[cutscene_wait,1],
	[cutscene_room_transition,rm_underground,144,704,dir_up],
];

walltext="This puddle is your size. Walk into it?";
walltext2=["Obviously.", "Nope!"];
nextline2=[-1,-1];
scripts2=[[create_cutscene,t_scene_info], [-1]];