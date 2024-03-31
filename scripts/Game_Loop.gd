extends Node

signal spawn_player(current_room: Array)

@export var player: Node

#global variables (scoping stops us from setting them in _ready)
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()
var enemy_gen: Enemy_Gen = Enemy_Gen.new()
@export var enemy_turn: Node3D
var map_generator: Map_Gen = Map_Gen.new()

var enemies_spawned: bool = true
var _result: Error

func _ready() -> void:
	map_generator.initialize_map()
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()
	grid_map.get_random_fight_room()
	#gnerates walls and enemies
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)
	
	_result = $UI/MapMenu.connect("unload_map", unload_level)
	_result = $UI/MapMenu.connect("load_map", load_level)
	
	#spawns player
	_result = emit_signal("spawn_player", GlobalVar.Current_Room)

#REMOVE AFTER TESTING ONLY WAY FOR NOW, ILL DO TURNS TOMORROW (KELAN)
func _physics_process(_delta: float) -> void:
	if GlobalVar.player_health <= 0:
		game_restart()
	
	#handel player and enemy turns
	if GlobalVar.players_turn == 1:
		GlobalVar.players_turn = 2
	elif GlobalVar.enemy_turn == 1:
		GlobalVar.enemy_turn = 0
		GlobalVar.player_actions = GlobalVar.player_max_actions
		GlobalVar.players_turn = 1
	if GlobalVar.boss_room and !GlobalVar.boss_intro and !GlobalVar.wave_spawned:
		enemy_gen.generate_enemies($Enemies)
		GlobalVar.wave_spawned = true


func load_level() -> void:
	map_generator.initialize_map()
	if !GlobalVar.boss_room:
		enemy_gen.generate_enemies($Enemies)
	wall_gen.generate_walls($Walls)
	_result = emit_signal("spawn_player", GlobalVar.Current_Room)


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
	GlobalVar.boss_room = false
	GlobalVar.boss_intro = false
	GlobalVar.boss_health = 90
	GlobalVar.wave_spawned = false
	GlobalVar.num_rooms_visited = 1
	
	unload_level()
	_result = get_tree().change_scene_to_file("res://scenes/UI/DeathMenu.tscn")
