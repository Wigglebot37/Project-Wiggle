if(!show_inventory) exit;
var ii=0,ix=0,iy=0,sx,sy,iitem,inv_grid=ds_inventory,sc=scalar,
	gwidth=game_width,gheight=game_height,xval=gheight*1/5;

create_nineslice(spr_boxlgback,Flavor,xval,0,gwidth,gheight*4/5);
create_nineslice(spr_boxlgback,Flavor,0,gheight*4/5,gwidth,gheight);

draw_sprite_ext(spr_border,0,0,0,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border,0,0,xval,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border,0,0,2*xval,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border,0,0,3*xval,2*sc,2*sc,0,c_white,1);

draw_sprite_ext(spr_evrtdn,20,32*sc,60*sc,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_evrtdn,1,32*sc,(60+64)*sc,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_evrtdn,1,32*sc,(60+64*2)*sc,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_evrtdn,1,32*sc,(60+64*3)*sc,2*sc,2*sc,0,c_white,1);

draw_sprite_ext(spr_border2,0,0,0,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border2,0,0,xval,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border2,0,0,2*xval,2*sc,2*sc,0,c_white,1);
draw_sprite_ext(spr_border2,0,0,3*xval,2*sc,2*sc,0,c_white,1);
	
repeat(inv_slots) {
	var y_start=((25*(iy+1))-8)*sc;
	iitem=inv_grid[# 0,ii];
	sx=(iitem mod spr_inv_columns)*cell_size;
	sy=(iitem div spr_inv_columns)*cell_size;
	
	draw_set_halign(fa_left);
	draw_set_color(c_black);
	var textx=xval+(20*sc)+(240*ix*sc);
	if(ii==selected_slot) {
		textx=xval+(45*sc)+(240*ix*sc);
		draw_sprite_ext(spr_textchoice,obj_pause_menu._sub,textx-20*sc,25*(iy+1)*sc,2*sc,2*sc,0,c_white,1);
		draw_sprite_part_ext(spr_items,0,sx,sy,cell_size,cell_size,0,game_height-70*sc,2*sc,2*sc,c_white,1);
		draw_text_ext_transformed(40*sc,game_height-30*sc,ds_items_info[# 1,iitem],0,game_width,sc,sc,0);
	}
	draw_text_ext_transformed(textx,y_start,ds_items_info[# 0,iitem],0,game_width,sc,sc,0);
	if(inputting && ii==inv_slots-1) {
		var x1=gwidth*1/4,y1=(gheight*2/5)-50*sc,x2=(gwidth*1/4)+100*sc,y2=(gheight*2/5)+45*sc;
		create_nineslice(spr_boxlgback,Flavor,x1,y1,x2,y2);
		
		var text0=x1+15*sc,text1=x1+15*sc,text2=x1+15*sc,sprx=text0,spry=y1+15*sc;
		switch(select_opt) {
			case 0: text0+=28*sc; sprx=text0-19*sc; spry=y1+20*sc; break;
			case 1: text1+=28*sc; sprx=text1-19*sc; spry=y1+45*sc; break;
			case 2: text2+=28*sc; sprx=text2-19*sc; spry=y1+70*sc; break;
		}
		draw_sprite_ext(spr_textchoice,obj_pause_menu._sub,sprx,spry,2*sc,2*sc,0,c_white,1);
		draw_text_ext_transformed(text0,y1+13*sc,"Use",gwidth,gheight,sc,sc,0);
		draw_text_ext_transformed(text1,y1+38*sc,"Give",gwidth,gheight,sc,sc,0);
		draw_text_ext_transformed(text2,y1+63*sc,"Drop",gwidth,gheight,sc,sc,0);
	}
	
	ii++;
	ix=ii mod inv_width; //Gives remainder from ii/inv_width
	iy=ii div inv_width; //Gives amount that inv_width can go into ii
}

if(obj_pause_menu.blackA!=0) {
	//blackA will act as a fader
	draw_set_alpha(obj_pause_menu.blackA);
	var c=c_black;
	draw_rectangle_color(0, 0,gwidth,gheight,c,c,c,c,false);
	draw_set_alpha(1);
}