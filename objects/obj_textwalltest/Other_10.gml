///@desc Dialogue Script

//---You can update variables here!---//
reset_dialogue_defaults();

//Line 0
var i = 0;
myText[i]		= walltext;
mySpeaker[i]	= id;

if(walltext!="") {
	i++;
	myText[i]		= walltext2;
	myTypes[i]		= 1;
	mySpeaker[i]	= id;
	myScripts[i]	= scripts2;
	myNextLine[i]	= nextline2;
}