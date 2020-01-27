///@description create_textevent
///@arg Text
///@arg Speaker
///@arg *Effects
///@arg *Speed
///@arg *Type
///@arg *Next_Line
///@arg *Scripts
///@arg *Text_Col

if(instance_exists(obj_textevent)) exit;

var arg_count = argument_count;
var i = 0, var arg; repeat(arg_count){
	arg[i] = argument[i];
	i++;
}

var textevent = instance_create_layer(0,0,"Objects",obj_textevent);

with(textevent){
	reset_dialogue_defaults();
	
	switch(arg_count-1){
		case 7: myTextCol	= arg[7];
		case 6: myScripts	= arg[6];
		case 5: myNextLine	= arg[5];
		case 4: myTypes		= arg[4];
		case 3: myTextSpeed	= arg[3];
		case 2: myEffects	= arg[2];
	}
	mySpeaker	= arg[1];
	myText		= arg[0];
	
	event_perform(ev_other, ev_user0);
}

return textevent;