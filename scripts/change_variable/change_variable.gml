///@description change_variable
///@arg object
///@arg var_name_string
///@arg value

if(argument0!=noone) {
	with(argument0) {
		variable_instance_set(id,argument1,argument2);
	}
} else variable_global_set(argument1,argument2);

