extends Node


signal spawn_player(current_room: Array)


@export var player: Node

#global variables (scoping stops us from setting them in _ready)
var grid_map: Grid_Map = Grid_Map.new()
var wall_gen: Wall_Gen = Wall_Gen.new()

func _ready() -> void:
	grid_map.load_rooms()
	grid_map.get_random_room()
	wall_gen.generate_walls($Walls)
	var _result: Error = emit_signal("spawn_player", GlobalVar.Current_Room)

func unload_level():
	wall_gen.unload_walls($Walls)
