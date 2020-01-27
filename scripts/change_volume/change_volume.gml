///@description change_volume
///@arg value

var type=menu_option[page];

switch(type) {
	case 2: audio_master_gain(argument0); break;
	case 3: audio_group_set_gain(audiogroup_sounds,argument0,0); break;
	case 4: audio_group_set_gain(audiogroup_music,argument0,0); break;
}