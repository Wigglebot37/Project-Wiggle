///@desc delete_save

if(file_exists("ProjectM.sav")) {
	file_delete("ProjectM.sav");
	show_debug_message("Save File Successfully Deleted.");
} else show_debug_message("File ProjectM.sav cannot be found.");