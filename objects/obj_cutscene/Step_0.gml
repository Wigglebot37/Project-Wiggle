script_execute_alt(current_scene[0],current_scene_array);

if(!cutscene_end && yy<40*scalar) yy+=4*scalar;
else if(cutscene_end && yy>0) yy-=4*scalar;
else if(cutscene_end && yy<=0) instance_destroy();

if(!cutscene_end && yy2>game_height-(40*scalar)) yy2-=4*scalar;
else if(cutscene_end && yy2<game_height) yy2+=4*scalar;