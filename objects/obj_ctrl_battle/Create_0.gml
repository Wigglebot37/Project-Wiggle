start_battle=false;

//Call this once in your object before using the shader script
col1 = make_color_rgb(0.8*255,0,0);
col2 = make_color_rgb(255,0.55*255,0);
DissolveSettings(sDissolve2_big,0,col1,col2,0.2);

fade=0;
fade2=1;
fadetrigger=false;
transsurf=noone;

stored_inst=noone;
stored_dir=0;
spawnX=0; spawnY=0;
spawnRoom=noone;
enemy=noone;