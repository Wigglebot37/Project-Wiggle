///@description cutscene_move_character
///@arg obj_inst
///@arg x
///@arg y
///@arg relative
///@arg spd

var obj=argument0,relative=argument3,new_spd=argument4;

if(x_dest==-1) {
	if(!relative) {
		x_dest=argument1;
		y_dest=argument2;
	} else {
		x_dest=obj.x+argument1;
		y_dest=obj.y+argument2;
	}
}

/*
For Reference:

dir_up=90;
dir_upright=45;
dir_right=0;
dir_downright=315;
dir_down=270;
dir_downleft=225;
dir_left=180;
dir_upleft=135;
*/

var xx=x_dest, yy=y_dest;

with(obj) {
	if(point_distance(x,y,xx,yy)>new_spd) {
		if(x<xx+1 && x>xx-1) x=xx;
		if(y<yy+1 && y>yy-1) y=yy;
		var new_dir=point_direction(x,y,xx,yy);
		spd=new_spd;
		
		if(new_dir==90) dir=dir_up;
		else if(new_dir==0) dir=dir_right;
		else if(new_dir==270) dir=dir_down;
		else if(new_dir==180) dir=dir_left;
		else if(new_dir>90 && new_dir<180) dir=dir_upleft;
		else if(new_dir<90 && new_dir>0) dir=dir_upright;
		else if(new_dir<360 && new_dir>270) dir=dir_downright;
		else if(new_dir>180 && new_dir<270) dir=dir_downleft;
	} else {
		x=xx;
		y=yy;
		spd=0;
		with(other) {
			x_dest=-1;
			y_dest=-1;
			cutscene_end_action();
		}
	}
}