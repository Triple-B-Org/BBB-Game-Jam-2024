extends Node


signal spawn_player(current_room: Array)

@export var player: Node

#global variables (scoping stops us from setting them in _ready)
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()
var enemy_gen: Enemy_Gen = Enemy_Gen.new()
var map_generator: Map_Gen = Map_Gen.new()

var enemy_turn: Enemy_Turn = Enemy_Turn.new()

func _ready() -> void:
	map_generator.load_map()
	#initial room load
	grid_map.load_fight_rooms()
	grid_map.load_rest_rooms()
	
	#gives room
	grid_map.get_random_fight_room()
	
	#gnerates walls and enemies
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)
	
	#spawns player
	var _result: Error = emit_signal("spawn_player", GlobalVar.Current_Room)

#REMOVE AFTER TESTING ONLY WAY FOR NOW, ILL DO TURNS TOMORROW (KELAN)
func _physics_process(_delta: float) -> void:
	if GlobalVar.players_turn == 1:
		GlobalVar.players_turn = 2
	
	if GlobalVar.enemy_turn == 1:
		GlobalVar.enemy_turn = 0
		enemy_turn.enemys_turn($Enemies)
		GlobalVar.player_actions = GlobalVar.player_max_actions
		GlobalVar.players_turn = 1
		
	if Input.is_action_just_pressed("ui_end"):
		unload_level()
		grid_map.get_random_fight_room()
		load_level()
		emit_signal("spawn_player", GlobalVar.Current_Room)

func load_level() -> void:
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)

func unload_level() -> void:
	wall_gen.unload_walls($Walls)
	enemy_gen.unload_enemies($Enemies)
