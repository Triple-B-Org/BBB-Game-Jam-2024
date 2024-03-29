class_name Map_Handle

extends Control

var game_start: String = "res://scenes/Main.tscn"


var map_generator: Map_Gen = Map_Gen.new()
var grid_map: Grid_Map = Grid_Map.new()
var player_choice: int


func _ready() -> void:
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()
	map_generator.initialize_map()


func handle_button_choice() -> void:
	if player_choice == 1:
		grid_map.get_random_fight_room()
	if player_choice == 2:
		grid_map.get_random_rest_room()


func on_left_pressed() -> void:
	player_choice = map_generator.get_left_option()
	print(player_choice)
	handle_button_choice()
	hide()
	var _result: Error = get_tree().change_scene_to_file(game_start)


func on_middle_pressed() -> void:
	player_choice = map_generator.get_middle_option()
	print(player_choice)
	handle_button_choice()
	hide()
	var _result: Error = get_tree().change_scene_to_file(game_start)


func on_right_pressed() -> void:
	player_choice = map_generator.get_right_option()
	print(player_choice)
	handle_button_choice()
	hide()
	var _result: Error = get_tree().change_scene_to_file(game_start)
