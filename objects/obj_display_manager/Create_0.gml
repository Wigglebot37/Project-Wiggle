globalvar scalar;
scalar=1;

event_inherited();
///Properties
ideal_width=640; //Doesn't matter because we are going to calculate this.
ideal_height=360; //Perfectly divisible by both 1080 and 720 which are the most common
zoom=1;
max_zoom=1;
globalvar display_w;
globalvar display_h;
display_w=display_get_width();
display_h=display_get_height();
//display_w=1366;
//display_h=768;

#region //Dynamic Scaling (Not being used for design purposes)
/*
//Aspect ratio
aspect_ratio = display_w/display_h;
aspect_ratio=clamp(aspect_ratio,16/10,21/9);

//Calculate new ideal width.
ideal_width=round(ideal_height*aspect_ratio);
//ideal_height=round(ideal_width/aspect_ratio);
 
ideal_width=round(ideal_width);
ideal_height=round(ideal_height);

if(display_w mod ideal_width!=0) {
	var d=round(display_w/ideal_width);
	ideal_width=display_w/d;
}
if(display_h mod ideal_height!=0) {
	var d=round(display_h/ideal_height);
	ideal_height=display_h/d;
}
 
//Check to make sure our ideal width and height isn't an odd number, as that's usually not good.
if(ideal_width & 1) ideal_width++;
if(ideal_height & 1) ideal_height++;
*/
#endregion

max_zoom = floor(display_w/ideal_width);
 
//Setup all the view ports so I don't have to.
globalvar Main_Camera;
Main_Camera = camera_create_view(0,0,ideal_width,ideal_height,0,noone,0,0,0,0);
camera_set_view_size(Main_Camera,ideal_width,ideal_height);
 
for(var i=1; i<= room_last; i++) {
  if(room_exists(i)) {    
        room_set_view_enabled(i,true);
        room_set_viewport(i,0,true,0,0,ideal_width,ideal_height);
        room_set_camera(i,0,Main_Camera);
  }
}
 
surface_resize(application_surface,ideal_width,ideal_height);
display_set_gui_size(ideal_width,ideal_height);
window_set_size(ideal_width*zoom,ideal_height*zoom);
 
alarm[0]=1; //Center Window