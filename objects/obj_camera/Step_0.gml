//Allows for gradual camera movement if needed
if(!snapx && (xTo-x)<=1 && (xTo-x)>=-1) {
	x=xTo; snapx=true;
} else if(snapx && (xTo-x)>1.5 && (xTo-x)<-1.5) snapx=false;

if(!snapy && (yTo-y)<=1 && (yTo-y)>=-1) {
	y=yTo; snapy=true;
} else if(snapy && (yTo-y)>1.5 && (yTo-y)<-1.5) snapy=false;

if(!pause) {
	x+=(xTo-x)/factor;
	y+=(yTo-y)/factor;
}

if(instance_exists(obj_everett)) follow=obj_everett;
else follow=noone;

if(follow!=noone) {
	xTo=floor(follow.x);
	yTo=floor(follow.y-16);
}

var zoomspeed=0.2;
view_zoom+=keyboard_check_pressed(ord("W"))*zoomspeed;
view_zoom-=keyboard_check_pressed(ord("S"))*zoomspeed;
view_zoom=clamp(view_zoom,1,view_max_zoom);

camera_set_view_size(view_camera[0],obj_display_manager.ideal_width/view_zoom,obj_display_manager.ideal_height/view_zoom);

// Clamping stops the screen scrolling when you each the end of a room
var xValue=clamp(x-camera_get_view_width(view_camera[0])/2, 0, room_width-camera_get_view_width(view_camera[0]));
var yValue=clamp(y-camera_get_view_height(view_camera[0])/2, 0, room_height-camera_get_view_height(view_camera[0]));
camera_set_view_pos(view_camera[0], xValue, yValue);