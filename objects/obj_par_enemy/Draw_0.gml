if(room==rm_battlescreen) pal_swap_set(spr_offion_pal,obj_beat.current_pal,false);
draw_self();
if(room==rm_battlescreen) pal_swap_reset();

if(flash>0) {
	flash-=0.1;
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shd_alpha=shader_get_uniform(shd_flash,"_alpha");
	shader_set_uniform_f(shd_alpha,flash)
	draw_self();
	shader_reset();
	gpu_set_blendmode(bm_normal);
}