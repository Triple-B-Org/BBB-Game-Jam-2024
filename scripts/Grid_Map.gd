class_name Grid_Map

#THIS IS ONLY FOR TESTING FOR N0W, NEEDS TO BE MADE DINAMIC, ADDED TO MY LIST (KELAN)
var Rooms: Array = [];

func _ready() -> void:
	Rooms.append([
		[3,3,3,3,3,3,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,0,0,0,3],
		[3,3,3,3,3,3,3]
	]);

# Returns a random room to be generated
func get_random_room() -> Array:
	return Rooms[0];
