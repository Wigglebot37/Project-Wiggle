///@desc Dialogue Script

//---You can update variables here!---//
reset_dialogue_defaults();


switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Welcome to Project M! I will show off textboxes and how cool they can look.";
		myTextCol[i]	= [56,c_orange, 61,c_white];
		mySpeaker[i]	= id;
		
		//Line 1
		i++;
		myText[i]		= "First of all, let's test out aaaaaall of these fancy effects in one line!";
		myEffects[i]	= [21,txtfx.flicker, 30,txtfx.pulse, 39,txtfx.wave_col_shift, 48,txtfx.shake, 54,txtfx.spin, 62,txtfx.wave, 69,txtfx.col_shift];
		myTextCol[i]	= [21,c_aqua, 30,c_lime, 39,c_navy, 48,c_purple, 54,c_yellow, 62,c_maroon, 69,c_teal];
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= "You can also choose what kind of cactus you want!";
		mySpeaker[i]	= id;
		
		//Line 3
		i++;
		myText[i]		= ["Barrel", "Saguaro", "A white tree"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_everett;
		myScripts[i]	= [[create_instance_layer,x-40,y,"Objects",obj_barcactusdrt], [create_instance_layer, x-40,y,"Objects",obj_sagcactus], 
							[create_instance_layer,x-50,y,"Objects",obj_treewt]];
		myNextLine[i]	= [4,5,6];
		
		//Line 4
		i++;
		myText[i]		= "Solid choice. I've heard you can do barrel rolls with those.";
		myEffects[i]	= [36,txtfx.spin, 49,0];
		myTextCol[i]	= [36,c_green, 49,c_white];
		mySpeaker[i]	= id;
		myNextLine[i]	= 7;

		//Line 5
		i++;
		myText[i]		= "Everyone's favorite pick-me-up. Except, please don't pick it up.";
		mySpeaker[i]	= id;
		myNextLine[i]	= 7;

		//Line 6
		i++;
		myText[i]		= "Okay, that's not even a cactus...";
		//myTextSpeed[i]	= [1,0.5, 10,0.1];
		mySpeaker[i]	= id;
		myNextLine[i]	= 7;

		//Line 7
		i++;
		myText[i]		= "I'll let you get back to the demo now though.";
		mySpeaker[i]	= id;
		myNextLine[i]	= -1;
		#endregion
	break;
	
	case "barrel":
	#region If you chose barrel
		var i = 0;
		//Line 0
		myText[i]		= "I'll stop with the dated memes now. Promise.";
		mySpeaker[i]	= id;
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	break;
	
	case "saguaro":
	#region If you chose saguaro
		var i = 0;
		//Line 0
		myText[i]		= "I don't care what you do, just don't hurt yourself.";
		myTextSpeed[i]	= [37,0.2, 42,1];
		mySpeaker[i]	= id;
		myTextCol[i]	= [37,c_red, 42,c_white];
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	break;
	
	case "tree":
	#region If you chose tree
		var i = 0;
		//Line 0
		myText[i]		= "Hey, I can't blame you for wanting to plant some trees.";
		mySpeaker[i]	= id;
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	break;
}