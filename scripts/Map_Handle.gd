class_name Map_Handle

extends Control

var map_gen: Map_Gen = Map_Gen.new()
var map_generator: Map_Gen = Map_Gen.new()
var grid_map: Grid_Map = Grid_Map.new()

func _ready() -> void:
	self.visible = false
	pass

func on_left_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_left_option()
	self.visible = false
	print(GlobalVar.player_choice)
	
func on_middle_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_middle_option()
	print(GlobalVar.player_choice)
	
func on_right_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_right_option()
	print(GlobalVar.player_choice)
