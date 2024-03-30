class_name Map_Handle

extends Control

signal load_map
signal unload_map

var map_gen: Map_Gen = Map_Gen.new()
var map_generator: Map_Gen = Map_Gen.new()
var grid_map: Grid_Map = Grid_Map.new()

@onready var left_button: Button = $Menu_Controller/MarginContainer/HBoxContainer/Left_Choice

var fight_icon: Texture2D = preload("res://assets/fight-icon.png")
var rest_icon: Texture2D = preload("res://assets/resticon.png")

func _ready() -> void:
	#left_button.connect("icon_change", change_icon)
	self.visible = false
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()


func on_left_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_left_option()
	do_map_loading()


func on_middle_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_middle_option()
	do_map_loading()


func on_right_pressed() -> void:
	GlobalVar.player_choice = map_generator.get_right_option()
	do_map_loading()


func do_map_loading() -> void:
	if GlobalVar.player_choice == 1:
		grid_map.get_random_fight_room()
	elif GlobalVar.player_choice == 2:
		grid_map.get_random_rest_room()
	GlobalVar.player_actions = GlobalVar.player_max_actions
	GlobalVar.players_turn = 1
	GlobalVar.enemy_turn = 0
	emit_signal("unload_map")
	emit_signal("load_map")
	self.visible = false
	
func change_icon() -> void:
	if GlobalVar.selectable_rooms[0] == 1:
		left_button.get_button_icon()
		left_button.set_button_icon(fight_icon)
	if GlobalVar.selectable_rooms[0] == 2:
		left_button.get_button_icon()
		left_button.set_button_icon(rest_icon)
