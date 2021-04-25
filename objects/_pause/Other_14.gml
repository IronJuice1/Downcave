/// @desc Assets

global.paused = true

text_scale = 2
text_on_screen = "Assets"

//Create buttons
var _id = constructor_button_dynamic(GAME_WIDTH*0.2, GAME_HEIGHT*0.35, 80, 30, "Pixel mobs", url_open, "https://henrysoftware.itch.io/pixel-mob", true)
ds_list_add(button_instance_list, _id)

var _id = constructor_button_dynamic(GAME_WIDTH*0.65	, GAME_HEIGHT*0.35, 230, 30, "\"Dungeon Crawl Stone Soup\" Assets", url_open, "https://opengameart.org/content/dungeon-crawl-32x32-tiles-supplemental", true)
ds_list_add(button_instance_list, _id)

var _id = constructor_button_dynamic(GAME_WIDTH*0.25, GAME_HEIGHT*0.6, 200, 30, "Humble Fonts (Equipment pro)", url_open, "https://somepx.itch.io/humble-fonts-free", true)
ds_list_add(button_instance_list, _id)

var _id = constructor_button_dynamic(GAME_WIDTH*0.78, GAME_HEIGHT*0.6, 230, 30, "Sound Effects, Subspace Audio", url_open, "https://opengameart.org/content/512-sound-effects-8-bit-style", true)
ds_list_add(button_instance_list, _id)


//Return
var _id = constructor_button_dynamic(GAME_WIDTH*0.5, GAME_HEIGHT*0.85, 80, 30, "Return", func_exit_pasue, undefined, true)
ds_list_add(button_instance_list, _id)