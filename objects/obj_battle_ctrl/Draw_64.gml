var c=c_black;
var sc=scalar,gwid=game_width,gheight=game_height;
draw_sprite_ext(spr_lucas,0,gwid/2,gheight-80*sc,2*sc,2*sc,0,c_white,1);
create_nineslice(spr_boxlgback,Flavor,gwid/2-gwid/8,gheight-80*sc,gwid/2+gwid/8,gheight);
draw_set_halign(fa_center);
draw_text_transformed(gwid/2,gheight-74*sc,"Lucas",sc,sc,0);

draw_set_halign(fa_left);
draw_set_color(c_black);
draw_sprite_ext(spr_battle_menu,choice,0,0,2*sc,2*sc,0,c_white,1);
draw_text_transformed(114*sc,4*sc,"Lucas",sc,sc,0);
draw_sprite_stretched(spr_lucaspfp,0,0,4*sc,53*2*sc,53*2*sc+4*sc);
draw_sprite_ext(spr_battle_menu_box,0,0,0,2*sc,2*sc,0,c_white,1);

var t=0,textx=0,texty=0; repeat(5) {
	switch(t) {
		case 0: text="Attack"; textx=79; texty=13; break;
		case 1: text="Skills"; textx=146; texty=13; break;
		case 2: text="Items"; textx=84; texty=24; break;
		case 3: text="Rest"; textx=149; texty=24; break;
		case 4: text="Escape"; textx=214; texty=24; break;
	}
	draw_text_transformed_color(textx*2*sc,texty*2*sc,text,sc,sc,0,c,c,c,c,1);
	t++;
}

draw_set_alpha(obj_game.blackA);
draw_rectangle_color(0,0,gwid,gheight,c,c,c,c,false);
draw_set_alpha(1);
draw_rectangle_color(0,obj_game.trany2,gwid,obj_game.trany1,c,c,c,c,false);