boxstart=game_height-(boxheight*scalary);
namestart=boxstart-40*scalary;

//textwidthlmt=game_width-(26*scalarx);

if(stop_dialogue) {
	if(yy<game_height) yy+=6*scalary;
	else {
		// Destroying this textbox instance and allow player movement
		obj_everett.active_textbox=noone;
		stop_dialogue=false;
		instance_destroy();
		exit;
	}
}

if(!stop_dialogue && yy2<40*scalary) yy2+=4*scalary;
else if(stop_dialogue && yy2>0) yy2-=4*scalary;

if(!stop_dialogue) {
	if(yy==boxstart && yp>boxstart+(20*scalary)) yp-=3*scalary;
	if(yy>boxstart) yy-=6*scalary;
	else if(yy<boxstart) yy=boxstart;
}

// For textend sprite animation
subchanger+=0.2;
if(subchanger==1.2) {
	sub++;
	subchanger=0;
}
var text_array_len=array_length_1d(text[page]);

//We check the type of dialogue to see if it is 0) "normal" or 1) a player choice dialogue.

#region TYPE 0: NORMAL
if(type[page] == 0){
	// get rid of "&& charCount==str_len" if adding in commented out areas
	//If we haven't "typed out" all the letters, immediately "type out" all letters (works as a "skip")
	if(input_interact && charCount<str_len && !stop_dialogue){
		charCount=string_length(text_NE);
	} else if(input_interact && charCount>=str_len && !stop_dialogue) {		
		//Only increase page IF page + 1,is less than the total number of entries
		if(page < array_length_1d(text)-1){
			event_perform(ev_other, ev_user0);
			audio_play_sound(snd_select1,50,false);
			var line=nextline[page];
			switch(line) {
				// Going up one page of text
				case 0: page++; break;
				// -1 is quitting case
				case -1: stop_dialogue=true; break; exit;
				// any other number will be valid
				default: page=line;
			}
			event_perform(ev_alarm, 1);
		} else { event_perform(ev_other, ev_user0); stop_dialogue=true; audio_play_sound(snd_select1,50,false); }
	}
} 
#endregion

#region TYPE 1: DIALOGUE CHOICE
else {
	if(chosen) exit;
	if(input_interact){ 
		chosen = true; 
		alarm[2] = 10; 
		audio_play_sound(select_snd_effect, priority_snd_effect, false);
	} 

	/*
	Choices are laid out in this order:
	_____________________________________
	|									|
	|	0			2			4		|
	|									|
	|	1			3			5		|
	|___________________________________|
	
	*/
	if(input_down_pres) {
		choice++; event_user(2);
	} else if(input_up_pres) {
		choice--; event_user(2);
	} else if(input_right_pres) {
		#region // Moving Cursor Right
		if(text_array_len==3) {
			if(choice==0) {
				choice=2; event_user(2);
			} else if(choice==1) {
				choice=0; event_user(2);
			} else if(choice==2) {
				choice=1; event_user(2);
			}
		} else if(text_array_len==4) {
			if(choice==0) {
				choice=2; event_user(2);
			} else if(choice==1) {
				choice=3; event_user(2);
			} else if(choice==2) {
				choice=1; event_user(2);
			} else if(choice==3) {
				choice=0; event_user(2);
			}
		} else if(text_array_len==5) {
			if(choice==0) {
				choice=2; event_user(2);
			} else if(choice==1) {
				choice=3; event_user(2);
			} else if(choice==2) {
				choice=4; event_user(2);
			} else if(choice==3) {
				choice=0; event_user(2);
			} else if(choice==4) {
				choice=1; event_user(2);
			}
		} else if(text_array_len==6) {
			if(choice==0) {
				choice=2; event_user(2);
			} else if(choice==1) {
				choice=3; event_user(2);
			} else if(choice==2) {
				choice=4; event_user(2);
			} else if(choice==3) {
				choice=5; event_user(2);
			} else if(choice==4) {
				choice=1; event_user(2);
			} else if(choice==5) {
				choice=0; event_user(2);
			}
		}
		#endregion
	} else if(input_left_pres) {
		#region // Moving Cursor Left
		if(text_array_len==3) {
			if(choice==0) {
				choice=1; event_user(2);
			} else if(choice==1) {
				choice=2; event_user(2);
			} else if(choice==2) {
				choice=0; event_user(2);
			}
		} else if(text_array_len==4) {
			if(choice==0) {
				choice=3; event_user(2);
			} else if(choice==1) {
				choice=2; event_user(2);
			} else if(choice==2) {
				choice=0; event_user(2);
			} else if(choice==3) {
				choice=1; event_user(2);
			}
		} else if(text_array_len==5) {
			if(choice==0) {
				choice=3; event_user(2);
			} else if(choice==1) {
				choice=4; event_user(2);
			} else if(choice==2) {
				choice=0; event_user(2);
			} else if(choice==3) {
				choice=1; event_user(2);
			} else if(choice==4) {
				choice=2; event_user(2);
			}
		} else if(text_array_len==6) {
			if(choice==0) {
				choice=5; event_user(2);
			} else if(choice==1) {
				choice=4; event_user(2);
			} else if(choice==2) {
				choice=0; event_user(2);
			} else if(choice==3) {
				choice=1; event_user(2);
			} else if(choice==4) {
				choice=2; event_user(2);
			} else if(choice==5) {
				choice=3; event_user(2);
			}
		}
		#endregion 
	}
	
	// Doesn't let choice be greater than the number of choices
	if(choice>text_array_len-1) choice=0;
	// Doesn't let choice be less than 0
	if(choice<0) choice=text_array_len-1;
}
#endregion