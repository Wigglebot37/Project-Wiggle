current_pal=0;

total_seconds=0;
if !audio_is_playing(snd_game2) {
    audio_play_sound(snd_game2,1,false);
    beateveryxseconds = 60/97;//120;
}
draw=false;
comboval=0;
comboend=false;
rhythmbattle=false;

val1=0.1;
val2=0.52;
//val2=0.42;

depth=20;