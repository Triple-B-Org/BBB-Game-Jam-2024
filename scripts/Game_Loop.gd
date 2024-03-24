extends Node

#global variables (scoping stops us from setting them in _ready)
var player_actions = 3;
var player_health = 3;
var grid_map = Grid_Map.new()
var wall_gen = Wall_Gen.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	grid_map.load_rooms()
	wall_gen.generate_walls(grid_map.get_random_room())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
