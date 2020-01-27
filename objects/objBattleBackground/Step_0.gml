//Increase wave variables to create illusion of animation
phaseoffset += phaserate;
tr_offsetx += speedx;
tr_offsety += speedy;

//current_pal=clamp(current_pal,0,pal_swap_get_pal_count(spr_box_pal)-1);
//if(current_pal>=pal_swap_get_pal_count(spr_battle_bckg_1_pal)-1) current_pal=0;

//Draw tiled sprite to the background surface
if(!surface_exists(surf)) surf=surface_create(room_width*2,room_height*2);