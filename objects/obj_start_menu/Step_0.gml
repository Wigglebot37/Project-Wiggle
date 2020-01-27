if(input_down_perm) {
	if(choice!=choicemax) audio_play_sound(snd_select,50,false);
	choice++;
} else if(input_up_perm) {
	if(choice!=0) audio_play_sound(snd_select,50,false);
	choice--;
}

if(room==rm_start_menu) {
	choicemax=3;
	text0="Start";
	text1="Options";
	text2="Sound Test Room";
	text3="Quit to desktop";
	if(choice==1 && input_enter) room_goto(rm_options_menu);
	else if(choice==2 && input_enter) room_goto(rm_sound_test);
	else if(choice==3 && input_enter) game_end();
} else if(room==rm_options_menu) {
	choicemax=2;
	text0="Delete current ProjectM.sav file";
	text1="Also does nothing.";
	text2="Back";
	text3="";
	if(choice==0 && input_enter) delete_save();
	else if(choice==1 && input_enter) text3="";
	else if(choice==2 && input_enter) room_goto(rm_start_menu);
} else if(room==rm_sound_test) {
	choicemax=4;
	text0="Menu Theme";
	text1="Town Theme (Day)";
	text2="Town Theme (Night)";
	text3="Main Theme";
	text4="Back";
	if(choice==0 && input_enter) {
		audio_stop_all(); audio_play_sound(msc_menu_theme,50,false);
	} else if(choice==1 && input_enter) {
		audio_stop_all(); audio_play_sound(msc_town_theme_day,50,false);
	} else if(choice==2 && input_enter) {
		audio_stop_all(); audio_play_sound(msc_town_theme_night,50,false);
	} else if(choice==3 && input_enter) {
		audio_stop_all(); audio_play_sound(msc_main_theme,50,false);
	} else if(choice==4 && input_enter) room_goto(rm_start_menu);
}

if(choice<0) choice=0;
if(choice>choicemax) choice=choicemax;

if(choice==0) {
	c01=c_red;
	c02=c_orange;
	c03=c_orange;
	c04=c_black;

	c11=c_black;
	c12=c_purple;
	c13=c_purple;
	c14=c_blue;

	c21=c_black;
	c22=c_purple;
	c23=c_purple;
	c24=c_blue;

	c31=c_black;
	c32=c_purple;
	c33=c_purple;
	c34=c_blue;
	
	c41=c_black;
	c42=c_purple;
	c43=c_purple;
	c44=c_blue;
} else if(choice==1) {
	c01=c_black;
	c02=c_purple;
	c03=c_purple;
	c04=c_blue;

	c11=c_red;
	c12=c_orange;
	c13=c_orange;
	c14=c_black;

	c21=c_black;
	c22=c_purple;
	c23=c_purple;
	c24=c_blue;

	c31=c_black;
	c32=c_purple;
	c33=c_purple;
	c34=c_blue;
	
	c41=c_black;
	c42=c_purple;
	c43=c_purple;
	c44=c_blue;
} else if(choice==2) {
	c01=c_black;
	c02=c_purple;
	c03=c_purple;
	c04=c_blue;

	c11=c_black;
	c12=c_purple;
	c13=c_purple;
	c14=c_blue;

	c21=c_red;
	c22=c_orange;
	c23=c_orange;
	c24=c_black;

	c31=c_black;
	c32=c_purple;
	c33=c_purple;
	c34=c_blue;
	
	c41=c_black;
	c42=c_purple;
	c43=c_purple;
	c44=c_blue;
} else if(choice==3) {
	c01=c_black;
	c02=c_purple;
	c03=c_purple;
	c04=c_blue;

	c11=c_black;
	c12=c_purple;
	c13=c_purple;
	c14=c_blue;

	c21=c_black;
	c22=c_purple;
	c23=c_purple;
	c24=c_blue;

	c31=c_red;
	c32=c_orange;
	c33=c_orange;
	c34=c_black;
	
	c41=c_black;
	c42=c_purple;
	c43=c_purple;
	c44=c_blue;
} else if(choice==4) {
	c01=c_black;
	c02=c_purple;
	c03=c_purple;
	c04=c_blue;

	c11=c_black;
	c12=c_purple;
	c13=c_purple;
	c14=c_blue;

	c21=c_black;
	c22=c_purple;
	c23=c_purple;
	c24=c_blue;

	c31=c_black;
	c32=c_purple;
	c33=c_purple;
	c34=c_blue;
	
	c41=c_red;
	c42=c_orange;
	c43=c_orange;
	c44=c_black;
}