start_pause=false;
end_pause=false;
//blur=0;
_alpha_mono=0;
alpha=0;
alpha2=0;
alphamax=140;
alphatext=0;
y_start=0;
interval=0;
boxplace=0;
subchanger=0;
sub0=0; sub1=0; sub2=0; sub3=0;
trigger=false;
transition=false;
blackA=0;
_sub=0;
subchanger2=0;
flavorholder=flavor.vanilla;
resize_set=false;
depth=0;

enum menu_page {
	Main,
	Inventory,
	Skills,
	Options,
	Controls,
	Flavors,
	Height
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
	input
}

ds_menu_main=create_menu_page(
	["Inventory",spr_inventory,menu_element_type.page_transfer,menu_page.Inventory],
	["Skills",spr_skills,menu_element_type.page_transfer,menu_page.Skills],
	["Options",spr_options,menu_element_type.page_transfer,menu_page.Options],
	["Save & Quit",spr_quit,menu_element_type.script_runner,save_quit_game]
);

ds_menu_inventory=create_menu_page(
	["",menu_element_type.page_transfer,menu_page.Main]
);

ds_menu_skills=create_menu_page(
	["",menu_element_type.page_transfer,menu_page.Main]
);

ds_menu_options=create_menu_page(
	["Fullscreen",spr_none,menu_element_type.script_runner,change_window_mode],
	["Rebind Controls",spr_none,menu_element_type.page_transfer,menu_page.Controls],
	["Master",spr_none,menu_element_type.slider,change_volume,0.75,[0,1]],
	["Sound FX",spr_none,menu_element_type.slider,change_volume,0.75,[0,1]],
	["Music",spr_none,menu_element_type.slider,change_volume,0.75,[0,1]],
	["Flavor",spr_none,menu_element_type.page_transfer,menu_page.Flavors]
);

ds_menu_controls=create_menu_page(
	["Up",spr_none,menu_element_type.input,"key_up",vk_up],
	["Down",spr_none,menu_element_type.input,"key_down",vk_down],
	["Left",spr_none,menu_element_type.input,"key_left",vk_left],
	["Right",spr_none,menu_element_type.input,"key_right",vk_right],
	["Action/Interact",spr_none,menu_element_type.input,"key_interact",ord("C")],
	["Revert/Dash",spr_none,menu_element_type.input,"key_revert",ord("X")]
);

ds_menu_flavors=create_menu_page(
	["Vanilla",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.vanilla],
	["Cantaloupe",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.cantaloupe],
	["Strawberry",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.strawberry],
	["Blueberry",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.blueberry],
	["Grape",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.grape],
	["Pineapple",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.pineapple],
	["Mint",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.mint],
	["Blackberry",spr_none,menu_element_type.script_runner,change_variable,noone,"Flavor",flavor.blackberry]
);

page=0;
menu_pages=[ds_menu_main,ds_menu_inventory,ds_menu_skills,ds_menu_options,ds_menu_controls,ds_menu_flavors];

var i=0,array_len=array_length_1d(menu_pages);
repeat(array_len) {
	menu_option[i]=0;
	i++;
}

xx=game_width;
x2=0;
unpause=false;
inputting=false;