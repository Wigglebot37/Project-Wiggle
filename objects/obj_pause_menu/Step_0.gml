var gwidth=game_width;

if(input_pause && obj_everett.active_textbox==noone && !pause && !obj_game.transitionbool && !instance_exists(obj_cutscene)) {
	pause=true; start_pause=true; alpha=0; alphatext=0; alpha2=0; audio_pause_all();
}

if((input_pause || input_revert) && page!=menu_page.Main && !trigger && blackA==0 && !obj_inventory.inputting) trigger=true;
if(xx<gwidth-80*scalarx || resize_set) xx=gwidth-80*scalarx;
if(x2>gwidth/5 || resize_set) x2=gwidth/5;
if(resize_set) resize_set=false;

if(pause && x2<gwidth/5 && unpause=false) x2+=6*scalarx;
if(pause && xx>gwidth-80*scalarx && unpause=false) xx-=4*scalarx;
else if(page==0 && pause && xx==gwidth-80*scalarx && (input_pause || input_revert) && unpause=false && !obj_game.transitionbool) unpause=true;

if(!unpause && alpha<(alphamax/255)) alpha+=0.02;
else if(!unpause && alpha>(alphamax/255)) alpha=(alphamax/255);

if(!unpause && alpha2<1) alpha2+=0.04;
else if(!unpause && alpha2>1) alpha2=1;

if(!unpause && alphatext<1) alphatext+=0.04;
else if(!unpause && alphatext>1) alphatext=1;

if(unpause && alpha>0) alpha-=0.02;
if(unpause && alpha2>0) alpha2-=0.04;
if(unpause && alphatext>0) alphatext-=0.04;

if(unpause=true) {
	if(x2>0) x2-=6*scalarx;
	if(xx<gwidth) xx+=4*scalarx;
	else {
		end_pause=true;
		pause=false;
		audio_resume_all();
		unpause=false;
	}
}

if(!pause) exit;
var ds_grid=menu_pages[page],ds_height=ds_grid_height(ds_grid);

subchanger2+=0.2;
if(subchanger2==1.2) {
	_sub++;
	subchanger2=0;
}

if(transition) {
	blackA+=0.04;
	if(blackA==1) {
		if(!trigger) page=ds_grid[# 3,menu_option[page]];
		else {
			if(page==menu_page.Controls) page=menu_page.Options;
			else if(page==menu_page.Inventory) page=menu_page.Main;
			else if(page==menu_page.Skills) page=menu_page.Main;
			else if(page==menu_page.Options) page=menu_page.Main;
			else if(page==menu_page.Flavors) page=menu_page.Options;
			trigger=false;
		}
		menu_option[page]=0;
		transition=false;
	}
} else {
	if(blackA>0) blackA-=0.04;
}

if(page!=menu_page.Inventory && page!=menu_page.Skills) {
	if(ds_grid[# 2,menu_option[page]]==menu_element_type.slider) {
		switch(menu_option[page]) {
			case 3: audio_stop_sound(msc_menu_theme); if(!audio_is_playing(snd_dooropen)) audio_play_sound(snd_dooropen,1,false); break;
			case 4: audio_stop_sound(snd_dooropen); if(!audio_is_playing(msc_menu_theme)) audio_play_sound(msc_menu_theme,1,false); break;
		}
		var hinput=input_right-input_left;
		if(hinput!=0) {
			ds_grid[# 4,menu_option[page]]+=hinput*0.01;
			ds_grid[# 4,menu_option[page]]=clamp(ds_grid[# 4,menu_option[page]],0,array_length_1d(ds_grid[# 5,menu_option[page]])-1);
			script_execute(ds_grid[# 3,menu_option[page]],ds_grid[# 4,menu_option[page]]);
		}
	}
	if(inputting) {
		switch(ds_grid[# 2,menu_option[page]]) {
			case menu_element_type.input:
				var kk=keyboard_lastkey;
				if(kk!=vk_enter) {
					if(kk!=ds_grid[# 4,menu_option[page]]) ds_grid[# 4,menu_option[page]]=kk;
					variable_global_set(ds_grid[# 3,menu_option[page]],kk);
					inputting=false;
				}
			break;
			default: inputting=false; break;
		}
	} else if(!transition) {
		if(xx==gwidth-80*scalarx) {
			var ochange=input_down_perm-input_up_perm;
			if(ochange!=0) {
				menu_option[page]+=ochange;
				if(menu_option[page]>ds_height-1) menu_option[page]=0;
				else if(menu_option[page]<0) menu_option[page]=ds_height-1;
				else audio_play_sound(snd_select,50,false);
			}
		}
	}
}
if((input_enter || input_interact) && page!=menu_page.Inventory && page!=menu_page.Skills) {
	audio_play_sound(snd_select1,50,false);
	switch(ds_grid[# 2,menu_option[page]]) {
		case menu_element_type.script_runner:
			if(ds_grid[# 3,menu_option[page]]!=change_variable) script_execute(ds_grid[# 3,menu_option[page]]); 
			flavorholder=Flavor;
		break;
		case menu_element_type.page_transfer: transition=true; break;
		case menu_element_type.slider:
		case menu_element_type.input:
			inputting=!inputting;
		break;
	}
} else if(trigger) transition=true;