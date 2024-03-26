extends Node


signal spawn_player(current_room: Array)


@export var player: Node

#global variables (scoping stops us from setting them in _ready)
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()
var enemy_gen: Enemy_Gen = Enemy_Gen.new()

var enemy_move: Enemy_Move = Enemy_Move.new()

func _ready() -> void:
	grid_map.load_rooms()
	grid_map.get_random_room()
	wall_gen.generate_walls($Walls)
	enemy_gen.generate_enemies($Enemies)
	var _result: Error = emit_signal("spawn_player", GlobalVar.Current_Room)

#REMOVE AFTER TESTING ONLY WAY FOR NOW, ILL DO TURNS TOMORROW (KELAN)
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_end"):
		enemy_move.enemys_turn($Enemies)

func unload_level() -> void:
	wall_gen.unload_walls($Walls)
