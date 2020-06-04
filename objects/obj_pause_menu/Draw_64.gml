if(!pause) exit;

var sc=scalar;
//blur=shader_get_uniform(shd_blur,"blur");
_alpha_mono=shader_get_uniform(shd_monochrome,"_alpha_mono");
shader_set(shd_monochrome);
shader_set_uniform_f(_alpha_mono,alpha2);
//shader_set_uniform_f(blur,alpha);
draw_surface_part(application_surface,0,0,game_width,game_height,0,0);
shader_reset();

var gwidth=game_width, gheight=game_height;

var ds_grid=menu_pages[page],ds_height=ds_grid_height(ds_grid);

var c=c_white;
draw_sprite_stretched_ext(spr_pausecov,0,0,0,gwidth,gheight,c,alpha);
var c=c_black;
draw_rectangle_color(xx,0,gwidth,gheight,c,c,c,c,false);

if(page==0) {
	create_nineslice(spr_boxlgmenu,Flavor,0,0,x2,gheight/4);
	create_nineslice(spr_boxlgmenu,Flavor,0,gheight/4,x2,(gheight/4)*2);
	create_nineslice(spr_boxlgmenu,Flavor,0,(gheight/4)*2,x2,(gheight/4)*3);
	create_nineslice(spr_boxlgmenu,Flavor,0,(gheight/4)*3,x2,gheight);
} else if(page!=menu_page.Inventory && page!=menu_page.Skills) {
	create_nineslice(spr_boxlgback,Flavor,0,0,gwidth,gheight*4/5);
	create_nineslice(spr_boxlgback,Flavor,0,gheight*4/5,gwidth,gheight);
}

var yy=0; repeat(ds_height) {
	interval=(gheight-(4*(64*sc)))/5;
	boxplace=(interval+(64*sc));
	y_start=interval+(boxplace*yy);
	y_start2=((25*(yy+1))-8)*sc;
	
	switch(ds_grid[# 2,yy]) {
		case menu_element_type.slider:
			c=c_black;
			var len=64*sc;
			var current_val=ds_grid[# 4,yy];
			draw_line_width_color((gwidth/2)-(len/2),y_start2,(gwidth/2)+(len/2),y_start2,2*sc,c,c);
			
			if(yy==menu_option[page]) c=c_gray;
			draw_circle_color(((gwidth/2)-(len/2))+(current_val*len),y_start2,4*sc,c,c,false);
			draw_text_transformed((gwidth/2)+(len*1.2),y_start2,string(floor(current_val*100))+"%",sc,sc,0);
			c=c_black;
		break;
		case menu_element_type.input:
			var current_val=ds_grid[# 4,yy];
			switch(current_val) {
				case vk_up: current_val="UP KEY"; break;
				case vk_left: current_val="LEFT KEY"; break;
				case vk_right: current_val="RIGHT KEY"; break;
				case vk_down: current_val="DOWN KEY"; break;
				case vk_decimal: current_val="."; break;
				default: current_val=chr(current_val); break;
			}
			if(inputting && yy==menu_option[page]) {
				c=c_gray;
				current_val="press key...";
			} else c=c_black;
			draw_text_ext_transformed_color(gwidth/2,y_start2,current_val,24*sc,gwidth,sc,sc,0,c,c,c,c,1);
		break;
	}
	if(page==menu_page.Main) {
		if(obj_inventory.show_inventory==true) obj_inventory.show_inventory=false;
		var sub=0;
		if(yy==menu_option[page]) {
			c=c_white;
			#region //Subimage animation changes
			if(yy==0) {
				sub1=0; sub2=0; sub3=0;
				if(sub0==0) sub0=1;
				subchanger+=0.1;
				if(subchanger==1.2) {
					if(sub0<4) sub0+=1;
					else if(sub0==4) sub0=1;
					subchanger=0;
				}
				sub=sub0;
			} else if(yy==1) {
				sub0=0; sub2=0; sub3=0;
				if(sub1==0) sub1=1;
				subchanger+=0.1;
				if(subchanger==1.2) {
					if(sub1<4) sub1+=1;
					else if(sub1==4) sub1=1;
					subchanger=0;
				}
				sub=sub1;
			} else if(yy==2) {
				sub1=0; sub0=0; sub3=0;
				if(sub2==0) sub2=1;
				subchanger+=0.1;
				if(subchanger==1.2) {
					if(sub2<7) sub2+=1;
					else if(sub2==7) sub2=1;
					subchanger=0;
				}
				sub=sub2;
			} else if(yy==3) {
				sub1=0; sub2=0; sub0=0;
				if(sub3==0) sub3=1;
				subchanger+=0.1;
				if(subchanger==1.2) {
					if(sub3<4) sub3+=1;
					else if(sub3==4) sub3=1;
					subchanger=0;
				}
				sub=sub3;
			}
			#endregion
			draw_set_halign(fa_right);
			draw_set_font(FONT_NORM);
			draw_text_ext_transformed_color(xx-5*sc,y_start+24*sc,ds_grid[# 0,yy],0,gwidth-85*sc,sc,sc,0,c,c,c,c,alphatext);
			draw_set_halign(fa_center);
		}
		draw_sprite_ext(ds_grid[# 1,yy],sub,xx+8*sc,y_start,2*sc,2*sc,0,c_white,1);
	} else if(page==menu_page.Inventory) {
		if(obj_inventory.show_inventory==false) {
			obj_inventory.show_inventory=true; obj_inventory.selected_slot=0;
		}
	} else if(page==menu_page.Skills) {
		
	} else {
		if(obj_inventory.show_inventory==true) obj_inventory.show_inventory=false;
		if(page==menu_page.Options && yy==0) {
			c=c_black;
			if(window_get_fullscreen()) draw_text_transformed_color((gwidth/2)+40*sc,y_start2,"On",sc,sc,0,c,c,c,c,1);
			else draw_text_transformed_color((gwidth/2)+40*sc,y_start2,"Off",sc,sc,0,c,c,c,c,1);
		}
		if(!inputting && yy==menu_option[page]) {
			if(ds_grid[# 6,menu_option[page]]!=Flavor && page==menu_page.Flavors) {
				if(yy!=8) script_execute(ds_grid[# 3,menu_option[page]],ds_grid[# 4,menu_option[page]],
					ds_grid[# 5,menu_option[page]],ds_grid[# 6,menu_option[page]]);
				else change_variable(noone,"Flavor",flavorholder);
			}
		} else c=c_black;
		if(yy==menu_option[page]) draw_sprite_ext(spr_textchoice,_sub,20*sc,25*(yy+1)*sc,2*sc,2*sc,0,c_white,1);
		if(!inputting && yy==flavorholder && page==menu_page.Flavors) draw_sprite_ext(spr_textend,_sub,152*sc,(25*(yy+1)+2)*sc,2*sc,2*sc,0,c_white,1);
		draw_set_halign(fa_left);
		draw_set_font(FONT_NORM);
		if(yy==menu_option[page]) var textx=35;
		else var textx=20;
		draw_text_ext_transformed_color(textx*sc,y_start2,ds_grid[# 0,yy],0,gwidth,sc,sc,0,c,c,c,c,alphatext);
		draw_set_halign(fa_center);
		if(page!=menu_page.Flavors && flavorholder!=Flavor) Flavor=flavorholder;
	}
	yy++;	
}

if(page!=0) c=c_dkgray;
else c=c_ltgray;
draw_set_halign(fa_center);

if(page==0) draw_text_transformed_color(gwidth/2,gheight-35*sc,"Press ESC to resume game",sc,sc,0,c,c,c,c,alphatext);
else draw_text_transformed_color(gwidth/2,gheight-35*sc,"Press ESC to go back",sc,sc,0,c,c,c,c,alphatext);

if(blackA!=0) {
	//blackA will act as a fader
	draw_set_alpha(blackA);
	draw_rectangle_color(0, 0, game_width, game_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}