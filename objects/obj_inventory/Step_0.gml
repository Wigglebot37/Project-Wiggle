//if(keyboard_check_pressed(ord("I"))) show_inventory=!show_inventory;
if(!show_inventory) exit;

var change=input_down_perm-input_up_perm;

if(inputting && change!=0) select_opt+=change;
if((change*2==2 || (change*2==-2 && selected_slot!=0 && selected_slot!=1)) && !inputting) selected_slot+=change*2;

if(select_opt>2) select_opt=2;
else if(select_opt<0) select_opt=0;

if(selected_slot!=0 && input_left_perm && !inputting) selected_slot-=1;
if(selected_slot!=inv_slots && input_right_perm && !inputting) selected_slot+=1;
if(selected_slot<0) selected_slot=0;
else if(selected_slot>=inv_slots) selected_slot=inv_slots-1;

if((input_interact || input_enter) && inputting && !char_select) {
	switch(select_opt) {
		case 0:
		case 1:/* char_select=true;*/ break;
		case 2:
			var yy=0; repeat(inv_slots-selected_slot) {
				if((selected_slot+yy)!=inv_slots-1) ds_inventory[# 0,selected_slot+yy]=ds_inventory[# 0,selected_slot+yy+1];
				else ds_inventory[# 0,selected_slot+yy]=item.none;
				yy++;
			}
			inputting=false;
			select_opt=0;
		break;
	}
} else if(!obj_pause_menu.trigger && (input_interact || input_enter) && !inputting) inputting=true;
else if(inputting && (input_revert || input_pause)) {
	inputting=false; select_opt=0;
}

var yy=0; repeat(inv_slots) {
	if(ds_inventory[# 0,yy]!=0) yy++;
	else if(selected_slot>=yy) selected_slot=yy-1;
}