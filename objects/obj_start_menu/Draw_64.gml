draw_set_halign(fa_center);

draw_set_font(FONT_NORM);

if(room==rm_start_menu) {
	draw_text_transformed_color(game_width/2,game_height-280*scalary,"Project M",4*scalarx,4*scalary,0,c_lime,c_olive,c_green,c_teal,1);
}
draw_text_transformed_color(game_width/2,game_height-160*scalary,text0,scalarx,scalary,0,c01,c02,c03,c04,1);
draw_text_transformed_color(game_width/2,game_height-130*scalary,text1,scalarx,scalary,0,c11,c12,c13,c14,1);
draw_text_transformed_color(game_width/2,game_height-100*scalary,text2,scalarx,scalary,0,c21,c22,c23,c24,1);	
draw_text_transformed_color(game_width/2,game_height-70*scalary,text3,scalarx,scalary,0,c31,c32,c33,c34,1);
draw_text_transformed_color(game_width/2,game_height-40*scalary,text4,scalarx,scalary,0,c41,c42,c43,c44,1);