if(current_pal>0 && !pause) current_pal-=.04*delta_time*(60/1000000);

total_seconds+=(delta_time*0.000001);
var value=total_seconds mod beateveryxseconds;
if(value<=0.02) current_pal=1; //makes objects pulse to the beat!
if((value<=val1 || value>=val2) && !pause) {
	if(input_interact && !draw) {
		draw=true;
		comboval++;
		comboend=false;
		with(obj_battle_ctrl) enemy.flash=1;
	} else if(input_interact) comboval=0;
	else if(!draw) comboend=true;
} else if((value>val1 && value<val2) && !pause) {
	if(input_interact) comboval=0;
	if(comboend) { comboval=0; comboend=false; }
	draw=false;
}

if(comboval>=16) {
	//obj_battle_ctrl.win=true;
}

if(keyboard_check_pressed(ord("Q"))) rhythmbattle=!rhythmbattle;