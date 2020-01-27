/// @description play_talking
/// @arg char
/// @arg pitch

char=argument0;
var pitch=argument1;

switch(char) {
	#region // Uppercase
	case "A": talk=snd_A; break;
	case "B": talk=snd_B; break;
	case "C": talk=snd_C; break;
	case "D": talk=snd_D; break;
	case "E": talk=snd_E; break;
	case "F": talk=snd_F; break;
	case "G": talk=snd_G; break;
	case "H": talk=snd_H; break;
	case "I": talk=snd_I; break;
	case "J": talk=snd_J; break;
	case "K": talk=snd_K; break;
	case "L": talk=snd_L; break;
	case "M": talk=snd_M; break;
	case "N": talk=snd_N; break;
	case "O": talk=snd_O; break;
	case "P": talk=snd_P; break;
	case "Q": talk=snd_Q; break;
	case "R": talk=snd_R; break;
	case "S": talk=snd_S; break;
	case "T": talk=snd_T; break;
	case "U": talk=snd_U; break;
	case "V": talk=snd_V; break;
	case "W": talk=snd_W; break;
	case "X": talk=snd_X; break;
	case "Y": talk=snd_Y; break;
	case "Z": talk=snd_Z; break;
	#endregion
	#region // Lowercase
	case "a": talk=snd_A_lower; break;
	case "b": talk=snd_B; break;
	case "c": talk=snd_C; break;
	case "d": talk=snd_D; break;
	case "e": talk=snd_E; break;
	case "f": talk=snd_F; break;
	case "g": talk=snd_G; break;
	case "h": talk=snd_H; break;
	case "i": talk=snd_I_lower; break;
	case "j": talk=snd_J; break;
	case "k": talk=snd_K; break;
	case "l": talk=snd_L; break;
	case "m": talk=snd_M; break;
	case "n": talk=snd_N; break;
	case "o": talk=snd_O; break;
	case "p": talk=snd_P; break;
	case "q": talk=snd_Q; break;
	case "r": talk=snd_R; break;
	case "s": talk=snd_S; break;
	case "t": talk=snd_T; break;
	case "u": talk=snd_U; break;
	case "v": talk=snd_V; break;
	case "w": talk=snd_W; break;
	case "x": talk=snd_X; break;
	case "y": talk=snd_Y; break;
	case "z": talk=snd_Z; break;
	#endregion
}

audio_sound_pitch(talk,pitch);
audio_play_sound(talk,50,false);