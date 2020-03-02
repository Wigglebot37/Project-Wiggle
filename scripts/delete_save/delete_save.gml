///@desc delete_save

if(file_exists("ProjectWiggle.sav")) {
	file_delete("ProjectWiggle.sav");
	show_debug_message("Save File Successfully Deleted.");
} else show_debug_message("File ProjectWiggle.sav cannot be found.");