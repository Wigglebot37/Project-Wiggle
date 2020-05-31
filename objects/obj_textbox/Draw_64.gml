// Creates textbox and namebox
var gwidth=game_width,gheight=game_height, sc=scalar;
var c=c_black;

if(!instance_exists(obj_cutscene)) draw_rectangle_color(0,0,gwidth,yy2,c,c,c,c,false);

if(yy!=boxstart) draw_rectangle_color(0,yy,gwidth,gheight,c,c,c,c,false);
else {
	//Draw portrait
	if(portrait[page]!=-1) draw_sprite_ext(portrait[page],1,(gwidth/4)+22*sc,yp,2*sc,2*sc,0,c_white,1);	
	create_nineslice(spr_textboxlg,Flavor,0,yy,gwidth,gheight);
}

// Sets font type for textboxes
draw_set_font(FONT_NORM);
draw_set_halign(fa_left);

var tp=text[page],text_array_len=array_length_1d(tp);
//draw_text(game_width/2,game_height/2,window_mouse_get_x());
if(yy==boxstart) {
	#region //Draw namebox and name
	if(name[page]!="Noone") {
		create_nineslice(spr_boxlg,Flavor,4*sc,namestart+(2*sc),(gwidth/4)+4*sc,boxstart+(8*sc));
		
		// Draw character name that is talking
		var namey=4;
		draw_set_halign(fa_center);
		c=name_col;
		draw_text_ext_transformed_color(5*sc+((gwidth/4)/2),namestart+(14+namey)*sc,name[page],fntsize,(gwidth/4)-10,2*sc,2*sc,0,c,c,c,c,1);
		draw_set_halign(fa_left);
	}
	#endregion
	//Draw the text differently if we are in 0) normal dialogue or 1) a dialogue choice
	#region TYPE 0: NORMAL DIALOGUE
	if(type[page] == 0) {
		// Makes text spell out one letter at a time
		if(charCount<str_len && !textpause) {
			#region Increment character counter (charCount) every frame, used for "typewriter"
			var tsc2 = text_speed_c*2;
			var txtspd = text_speed[page];
			if(text_speed_c+1 < text_speed_al && charCount == txtspd[tsc2+2]) {
				text_speed_c++;
				tsc2 = text_speed_c*2;
			}
			charCount += txtspd[tsc2+1];
			#endregion
			
			char = string_char_at(text_NE, charCount);
			
			switch(string_char_at(text_NE,floor(charCount))) {
				case " ": break;
				case ",":
				case ".": textpause=true; alarm[0]=10; break;
				case "?":
				case "!": textpause=true; alarm[0]=20; break;
				default: if(name[page]!="Noone") 
				play_talking(char,pitch[page]); break;
			}
		}
			#region // Draw the lines of text being delivered
			
			#region // Setup for Effects
			var col = default_col, cc = 1, y2 = boxstart+18*sc, x2 = 14*sc, cx = 0, cy = 0;
			var by = 0, bp_len = -1, effect = 0, next_space,effects_c = 0, text_col_c = 0, bp_array = breakpoints; 
	
			//Check if there are breakpoints in this string, if there are save their lengths
			if(bp_array != -1) { bp_len = array_length_1d(bp_array); next_space = breakpoints[by]; by++; }
			
			//For sin wave stuff
			t += 1;
			var so = t;
			var shift = sin(t*pi*2/60)*3;
			#endregion
			
			#region // Draw the Letters
			repeat(charCount) {
				//Get current letter
				char = string_char_at(text_NE, cc);
	
				var ec2 = effects_c*2;
				if(effects_c < effects_al && effects_p[ec2] == cc) { 
					effects_c++; 
					effect = effects_p[ec2+1];
				}
		
				var tc2 = text_col_c*2;
				if(text_col_c < text_col_al && text_col_p[tc2] == cc) { 
					text_col_c++;
					col = text_col_p[tc2+1];
				}
				
				//Get next space, deal with new lines
				if(bp_len != -1 && cc == next_space) {
					cy += 1; cx=-charSize*sc+12*sc;
					if(by < bp_len) {
						next_space = breakpoints[by];
						by++;
					}
				}
				//draw_text_ext_transformed(14*sc,boxstart+14*sc,textPart,fntsize,textwidthlmt,sc,sc,0);
				
				switch(effect) {
					case 0:	//normal
						draw_text_transformed_color(x2+(cx),y2+(cy*stringHeight*sc),char,2*sc,2*sc,0,col,col,col,col,1);
					break;
			
					case 1:	//shakey
						draw_text_transformed_color(x2+(cx)+random_range(-1,1),y2+(cy*stringHeight*sc)+random_range(-1,1),char,2*sc,2*sc,0,col,col,col,col,1);
					break;
			
					case 2:	//wave
						var so = t;
						var shift = sin(so*pi*freq/room_speed)*amplitude;
						draw_text_transformed_color(x2 + (cx),y2+(cy*stringHeight*sc)+shift,char,2*sc,2*sc,0,col,col,col,col,1);
					break; 
			
					case 3: //colour shift
						var c1 = make_colour_hsv(t+cc,255,255);
						var c2 = make_colour_hsv(t+cc+34,255,255);
						draw_text_transformed_color(x2 + (cx),y2+(cy*stringHeight*sc),char,2*sc,2*sc,0,c1,c1,c2,c2,1);
					break;
		
					case 4: //wave AND colour shift
						var so = t + cc;
						var shift = sin(so*pi*freq/room_speed)*amplitude;
						var c1 = make_colour_hsv(t+cc,255,255);
						var c2 = make_colour_hsv(t+cc+45,255,255);
						draw_text_transformed_color(x2 + (cx),y2+(cy*stringHeight*sc)+shift,char,2*sc,2*sc,0,c1,c1,c2,c2,1);
					break; 
		
					case 5: //spin
						var so = t + cc;
						var shift = sin(so*pi*freq/room_speed);
						var mv = charSize/2;
						draw_set_valign(fa_middle); draw_set_halign(fa_middle);
						draw_text_transformed_color(x2 + (cx)+mv+3*sc,y2+(cy*stringHeight*sc)+(stringHeight/2*sc)-4*sc,char,2*sc,2*sc,shift*20,col,col,col,col,1);
						draw_set_valign(fa_top); draw_set_halign(fa_left);
					break;
				
					case 6: //pulse
						var so = t + cc;
						var shift = abs(sin(so*pi*freq/room_speed));
						var mv = charSize/2;
						draw_set_valign(fa_middle); draw_set_halign(fa_middle);
						draw_text_transformed_color(x2 + (cx)+mv,y2+(cy*stringHeight*sc)+(stringHeight/2*sc)-4*sc,char,2*shift*sc,2*shift*sc,0,col,col,col,col,1);
						draw_set_valign(fa_top); draw_set_halign(fa_left);
					break;
				
					case 7:	//flicker
						var so = t + cc;
						var shift = sin(so*pi*freq/room_speed);
						draw_text_transformed_color(x2 + (cx),y2+(cy*stringHeight*sc),char,2*sc,2*sc,0,col,col,col,col,shift+random_range(-1,1));
					break; 
				}
		
				//Increment variables for next letter
				cc += 1;
				switch(char) {
					// 6-wide
					case "&": cx+=charSize*sc+4*sc; break;
					#region // 4-wide
					case "J":
					case "L":
					case "b":
					case "c":
					case "d":
					case "e":
					case "f":
					case "g":
					case "h":
					case "k":
					case "n":
					case "o":
					case "p":
					case "q":
					case "r":
					case "s":
					case "t":
					case "u":
					case "v":
					case "y":
					case "z":
					case " ":
					case "(":
					case ")": cx+=charSize*sc; break;
					#endregion
					// 3-wide
					case "I":
					case "i":
					case "j":
					case "l": cx+=charSize*sc-2*sc; break;
					// 2-wide
					case ",":
					case "'":
					case ";": cx+=charSize*sc-4*sc; break;
					// 1-wide
					case ":":
					case ".":
					case "!": cx+=charSize*sc-6*sc; break;
					// 5-wide
					default: cx+=charSize*sc+2*sc;
				}
			}
			#endregion
			#endregion
	#endregion
	#region TYPE 1: DIALOGUE CHOICE
	} else if(type[page]==1) {
		charCount=str_len;
		var i=0,y_add=0; repeat(text_array_len) {
			#region //Outline (Not in use)
			/*
			var _r=0,_g=0,_b=0;
			c=c_black;
			_r=color_get_red(c)/255;
			_g=color_get_green(c)/255;
			_b=color_get_blue(c)/255;
			
			shader_set(shd_outline);
			shader_set_uniform_f(font_pixelW,font_texelW);
			shader_set_uniform_f(font_pixelH,font_texelH);
			shader_set_uniform_f(col_r,_r);
			shader_set_uniform_f(col_g,_g);
			shader_set_uniform_f(col_b,_b);
			draw_sprite(sprite_index,0,x,y);
			//shader_reset();
			*/
			#endregion
			c=c_white;
			if(choice==i) {
				if(chosen) c=select_col;
				else c=choice_col;
				//c=$1D94F8; //Orange
				if(i<=1) xval=38;
				else if(i==2 || i==3) xval=24+(576/3);
				else xval=48+(576*2/3);
				draw_sprite_ext(spr_textchoice,sub,(xval-18)*sc,(boxstart+26*sc)+y_add*sc,2*sc,2*sc,0,c_white,1);
			} else if(i<=1) xval=14;
			else if(i==2 || i==3) xval=(576/3);
			else xval=24+(576*2/3);
			var ctext=tp[i];
			draw_text_ext_transformed_color(xval*sc,(boxstart+18*sc)+y_add*sc,ctext,fntsize,textwidthlmt,2*sc,2*sc,0,c,c,c,c,1);
			if(y_add<fntsize*1) y_add+=fntsize;
			else y_add=0;
			i++;
		}
	}
	#endregion
	#region //Text end Sprite
	// Adds textend sprite showing that the player can continue to the next body of text
	if(charCount>=str_len && type[page]=0) {
		draw_sprite_ext(spr_textcont,sub,gwidth-29*sc,gheight-25*sc,2*sc,2*sc,0,c_white,1);
		//draw_sprite_ext(spr_textend,sub,gwidth-25*sc,gheight-25*sc,2*sc,2*sc,0,c_white,1);
	}
	#endregion
}