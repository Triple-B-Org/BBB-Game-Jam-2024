class_name Map_Handle

extends Control

signal load_map
signal unload_map

var map_gen: Map_Gen = Map_Gen.new()
var map_generator: Map_Gen = Map_Gen.new()
var grid_map: Grid_Map = Grid_Map.new()

func _ready() -> void:
	self.visible = false
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()
	pass

func on_left_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_left_option()
	if GlobalVar.player_choice == 1:
		grid_map.get_random_fight_room()
	elif GlobalVar.player_choice == 2:
		grid_map.get_random_rest_room()
	emit_signal("unload_map")
	emit_signal("load_map")
	self.visible = false
	print(GlobalVar.player_choice)
	
func on_middle_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_middle_option()
	if GlobalVar.player_choice == 1:
		grid_map.get_random_fight_room()
	elif GlobalVar.player_choice == 2:
		grid_map.get_random_rest_room()
	emit_signal("unload_map")
	emit_signal("load_map")
	self.visible = false
	print(GlobalVar.player_choice)
	
func on_right_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_right_option()
	if GlobalVar.player_choice == 1:
		grid_map.get_random_fight_room()
	elif GlobalVar.player_choice == 2:
		grid_map.get_random_rest_room()
	emit_signal("unload_map")
	emit_signal("load_map")
	self.visible = false
	print(GlobalVar.player_choice)
