draw_set_halign(fa_center);

draw_set_font(FONT_NORM);
var sc=scalar;

if(room==rm_start_menu) {
	draw_text_transformed_color(game_width/2,game_height-280*sc,"Project Wiggle",6*sc,6*sc,0,c_lime,c_olive,c_green,c_teal,1);
}
draw_text_transformed_color(game_width/2,game_height-160*sc,text0,3*sc,3*sc,0,c01,c02,c03,c04,1);
draw_text_transformed_color(game_width/2,game_height-130*sc,text1,3*sc,3*sc,0,c11,c12,c13,c14,1);
draw_text_transformed_color(game_width/2,game_height-100*sc,text2,3*sc,3*sc,0,c21,c22,c23,c24,1);	
draw_text_transformed_color(game_width/2,game_height-70*sc,text3,3*sc,3*sc,0,c31,c32,c33,c34,1);
draw_text_transformed_color(game_width/2,game_height-40*sc,text4,3*sc,3*sc,0,c41,c42,c43,c44,1);