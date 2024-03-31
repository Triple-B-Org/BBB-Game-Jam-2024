extends Control

signal load_map
signal unload_map

var map_gen: Map_Gen = Map_Gen.new()
var map_generator: Map_Gen = Map_Gen.new()
var grid_map: Grid_Map = Grid_Map.new()

@onready var left_button: Button = $Menu_Controller/MarginContainer/HBoxContainer/Left_Choice
@onready var middle_button: Button = $Menu_Controller/MarginContainer/HBoxContainer/Middle_Choice
@onready var right_button: Button = $Menu_Controller/MarginContainer/HBoxContainer/Right_Choice

var fight_icon: Texture2D = preload("res://assets/fight-icon.png")
var rest_icon: Texture2D = preload("res://assets/resticon.png")
var boss_icon: Texture2D = preload("res://assets/boss-icon.png")

func _ready() -> void:
	left_button.visibility_changed.connect(self.change_icon)
	middle_button.visibility_changed.connect(self.change_icon)
	right_button.visibility_changed.connect(self.change_icon)
	visible = false
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
	elif GlobalVar.player_choice == 3:
		grid_map.get_boss_room()
	GlobalVar.player_actions = GlobalVar.player_max_actions
	GlobalVar.players_turn = 1
	GlobalVar.enemy_turn = 0
	emit_signal("unload_map")
	emit_signal("load_map")
	$"..".close_map_menu()


func change_icon() -> void:
	var buttons = [left_button, middle_button, right_button]
	var room_icons = [fight_icon, rest_icon, boss_icon]
	for i: int in range(3):
		buttons[i].icon = room_icons[GlobalVar.selectable_rooms[i] - 1]
