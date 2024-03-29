extends Node

signal spawn_player(current_room: Array)

@export var player: Node

#global variables (scoping stops us from setting them in _ready)
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()
var enemy_gen: Enemy_Gen = Enemy_Gen.new()
var enemy_turn: Enemy_Turn = Enemy_Turn.new()
var map_generator: Map_Gen = Map_Gen.new()
var map_handle: Map_Handle = Map_Handle.new()

var enemies_spawned: bool = true

func _ready() -> void:
	map_generator.initialize_map()
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()
	grid_map.get_random_fight_room()
	#gnerates walls and enemies
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)
	
	$UI/MapMenu.connect("unload_map", unload_level)
	$UI/MapMenu.connect("load_map", load_level)
	
	#spawns player
	var _result: Error = emit_signal("spawn_player", GlobalVar.Current_Room)

#REMOVE AFTER TESTING ONLY WAY FOR NOW, ILL DO TURNS TOMORROW (KELAN)
func _physics_process(_delta: float) -> void:
	if GlobalVar.player_health <= 0:
		game_restart()
	
	#handel player and enemy turns
	if GlobalVar.players_turn == 1:
		GlobalVar.players_turn = 2
	elif GlobalVar.enemy_turn == 1:
		GlobalVar.enemy_turn = 0
		enemy_turn.enemys_turn($Enemies)
		GlobalVar.player_actions = GlobalVar.player_max_actions
		GlobalVar.players_turn = 1
		

func load_level() -> void:
	map_generator.initialize_map()
	enemy_gen.generate_enemies($Enemies)
	wall_gen.generate_walls($Walls)
	emit_signal("spawn_player", GlobalVar.Current_Room)
	

func unload_level() -> void:
	wall_gen.unload_walls($Walls)
	enemy_gen.unload_enemies($Enemies)
	
func game_restart() -> void:
	#reset global variables
	GlobalVar.Current_Room = []
	GlobalVar.enemies = []
	GlobalVar.player_max_actions = 3
	GlobalVar.player_actions = 3
	GlobalVar.player_max_health = 3
	GlobalVar.player_health = 3
	GlobalVar.players_turn = 1
	GlobalVar.enemy_turn = 0
	
	unload_level()
	get_tree().change_scene_to_file("res://scenes/UI/MainMenu.tscn")
	grid_map.get_random_fight_room()
	
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)
	
	emit_signal("spawn_player", GlobalVar.Current_Room)
