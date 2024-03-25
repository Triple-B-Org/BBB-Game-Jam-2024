extends Node


signal spawn_player(current_room: Array)


@export var player: Node


#global variables (scoping stops us from setting them in _ready)
var player_actions: int = 3;
var player_health: int = 3;
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()


func _ready() -> void:
	grid_map.load_rooms()
	wall_gen.generate_walls($Walls, grid_map.get_random_room())
	var _result: Error = emit_signal("spawn_player", grid_map.Current_Room)
