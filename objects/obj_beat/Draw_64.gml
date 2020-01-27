if(rhythmbattle) {
	draw_set_halign(fa_middle);
	if(draw) {
		var c=c_purple;
		draw_text_transformed_color(game_width/2,game_height/2,"Combo!",scalarx,scalarx,0,c,c,c,c,1);
	}
	var c=c_maroon;
	draw_text_transformed_color(game_width/2,game_height*3/4,"comboval: "+string(comboval),scalarx,scalarx,0,c,c,c,c,1);
	var c=c_yellow;
	if(comboval==0) draw_text_transformed_color(game_width/2,game_height*1/4,"Missed the Beat!",scalarx,scalarx,0,c,c,c,c,1);
}