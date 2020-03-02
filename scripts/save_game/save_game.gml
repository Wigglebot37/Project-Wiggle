///@description save_game

var _root_list=ds_list_create();

with(obj_everett) {
	var _map=ds_map_create();
	ds_list_add(_root_list,_map);
	ds_list_mark_as_map(_root_list,ds_list_size(_root_list)-1);
	
	var _obj=object_get_name(object_index);
	ds_map_add(_map,"obj",_obj);
	ds_map_add(_map,"x",x);
	ds_map_add(_map,"y",y);
}

// wrap root list in a map
var _wrapper=ds_map_create();
ds_map_add_list(_wrapper,"ROOT",_root_list);

// save everything into a string
var _string=json_encode(_wrapper);
save_string_to_file("ProjectWiggle.sav",_string);

// destroys all data
ds_map_destroy(_wrapper);

show_debug_message("Game Saved.");