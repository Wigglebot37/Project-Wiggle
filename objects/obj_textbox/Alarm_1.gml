///@description Setup
//Must be done AFTER the handover occurs, so frame after created, and after every text page change

#region Reset variables
charCount		= 0;
text_speed_c	= 0;
charCount_f		= 0;
effects_p		= effects[page];
text_col_p		= text_col[page];

text_speed_al	= array_length_1d(text_speed[page])/2;
effects_al		= array_length_1d(effects[page])/2;
text_col_al		= array_length_1d(text_col[page])/2;

draw_set_font(font[page]);
charSize = 13;
stringHeight = fntsize;
#endregion

#region GET THE BREAKPOINTS AND TEXT EFFECTS
//Again only need to do this if our CURRENT page is "normal". Separated from above for readability.
if(type[page] == 0){
	text_NE = text[page]; 
	str_len = string_length(text_NE);
	
	//Get variables ready
	var by = 0, cc = 1, breakpoint = 0,cx=0;
	var next_space = 0, char, txtwidth=textwidthlmt;

	//Reset the text effects and breakpoints arrays
	breakpoints = -1;
	
	//Loop through and save the effect positions and breakpoints
	repeat(str_len){
		//Save Effect Positions
		char = string_char_at(text_NE, cc);
		switch(char) {
			case "i":
			case "l":
			case ",":
			case ".":
			case "'":
			case ":":
			case ";":
			case "!": cx+=charSize-8*scalarx; break;
			case " ": cx+=charSize-6*scalarx; break;
			default: cx+=charSize*scalarx;
		}
		
		//Get next space, deal with new lines
		if(cc >= next_space){
			next_space = cc;
			while(next_space < str_len && string_copy(text_NE, next_space,1) != " ") next_space++;
			var linewidth = (next_space-breakpoint)+cx;
			if (linewidth>=txtwidth) { breakpoint=cc; breakpoints[by]=cc; by++; cx=0; } 
		}
		cc++;
	}
}
#endregion