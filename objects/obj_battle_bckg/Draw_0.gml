if(alpha>0) { //Don't even bother drawing this if the background is invisible anyway
    surface_set_target(surf);
	//pal_swap_set(spr_battle_bckg_1_pal,current_pal,true);
    draw_sprite_tiled_area(back,image_index,tr_offsetx,tr_offsety,0,0,view_width,view_height);
	//DissolveShader(back,image_index,tr_offsetx,tr_offsety,fade);
    surface_reset_target();

    var phase,step,fstep,istep,offx,gheight=obj_display_manager.ideal_height,gwidth=obj_display_manager.ideal_width;
    fstep = (scanline == 2);
    istep = 1 + (scanline > 0);
    if surface_exists(surf) { //Always make sure the surface is around
        for (var step=fstep; step<gwidth; step+=istep) {
            phase = sin(frequency*(step+phaseoffset)/gheight);
            if(effect==0) {
                //Sine
                offx=(((offsetx mod gwidth)+gwidth) mod gwidth);
                sourcex=offx+sin(phase)*amplitude;
                sourcey=step+offsety;
                draw_surface_part_ext(surf,sourcex,sourcey,gwidth,1,0,step,1,1,c_white,alpha);
				//draw_surface(surf,0,0); - Test
            } else if(effect==1) {
                //Vert. Comp
                sourcex=0;
                sourcey=offsety+step+sin(phase)*amplitude;
                draw_surface_part_ext(surf,sourcex,sourcey,gwidth,1,0,step,1,1,c_white,alpha);
            } else if(effect==2) {
                //Horz. Comp (incomplete, weird effect)
                part=gwidth-sourcex-8;
                sourcex=step+sin(phase)*amplitude+100;
                sourcey=0
                draw_surface_part_ext(surf,sourcex,sourcey,gwidth,1,0,step,1,1,c_white,alpha);
            } else if(effect==3) {
                //Sine + Vert. Comp (needs extra width)
                offx=(((offsetx mod gwidth)+gwidth) mod gwidth);
                sourcex=offx+sin(phase)*amplitude;
                sourcey=offsety+step+sin(phase)*amplitude;
                part=gwidth-sourcex;
                draw_surface_part_ext(surf,sourcex,sourcey,part,1,0,step,1,1,c_white,alpha);
            }
        }
		//pal_swap_reset();
    }
}

