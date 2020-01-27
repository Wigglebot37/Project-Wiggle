depth=-1;

show_inventory=false;

selected_slot=0;
inputting=false;

char_select=false;
inv_slots=18;
inv_width=2;
select_opt=0;
cell_size=32;
spr_inv_columns=sprite_get_width(spr_items)/cell_size;

ds_inventory=ds_grid_create(1,inv_slots);

enum item {
	none=0,
	cookie=1,
	pie=2,
	lollipop=3,
	height=4 //trick to easily get height of an enumerator
}

ds_items_info=ds_grid_create(2,item.height);
var z=0,i=0;
ds_items_info[# z,i++]="";
ds_items_info[# z,i++]="Cookie";
ds_items_info[# z,i++]="Pumpkin Pie";
ds_items_info[# z,i++]="Lollipop";

z=1; i=0;
ds_items_info[# z,i++]="";
ds_items_info[# z,i++]="Crummy.";
ds_items_info[# z,i++]="Great with whip cream.";
ds_items_info[# z,i++]="How many licks...?";

var yy=0; repeat(inv_slots) {
	if(yy<inv_slots-1) ds_inventory[# 0,yy]=irandom_range(1,item.height-1);
	yy++;
}