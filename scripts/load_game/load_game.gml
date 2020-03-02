///@desc load_game

with(obj_everett) instance_destroy();

if(file_exists("ProjectWiggle.sav")) {
	var _wrapper=load_JSON_from_file("ProjectWiggle.sav");
	var _list=_wrapper[? "ROOT"];
	// or var _list=ds_map_find_value(_wrapper,"ROOT");

	for(var i=0; i<ds_list_size(_list); i++) {
		var _map=_list[| i];
		// or var _map=ds_list_find_value(_list,i);
		
		var _obj=_map[? "obj"];
		with(instance_create_layer(0,0,layer,asset_get_index(_obj))) {
			x=_map[? "x"];
			y=_map[? "y"];
		}
	}
	ds_map_destroy(_wrapper);
	show_debug_message("Game Loaded.");
	
} else show_debug_message("Cannot find ProjectWiggle.sav");