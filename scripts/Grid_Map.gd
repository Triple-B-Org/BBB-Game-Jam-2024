class_name Grid_Map

#THIS IS ONLY FOR TESTING FOR N0W, NEEDS TO BE MADE DINAMIC, ADDED TO MY LIST (KELAN)
var Rooms: Array = []
var Current_Room: Array = []

func _ready() -> void:
	load_rooms()
	
# Returns a random room to be generated
func get_random_room() -> Array:
	Current_Room = Rooms[randi() % Rooms.size()]
	return Current_Room



#this function is for putting in your room layouts
func load_rooms() -> void:
	Rooms.append([
		[3,3,3,3,3,3,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,1,0,0,3],
		[3,3,3,3,3,3,3]
	]);
	
	Rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3],
		[3,3,3,0,0,0,3,0,0,3,3],
		[3,3,0,0,0,0,0,0,0,3,3],
		[3,3,0,0,3,3,3,3,0,3,3],
		[3,3,3,0,3,3,3,3,0,0,3],
		[3,3,3,0,3,3,3,3,0,0,3],
		[3,3,3,0,3,3,3,3,0,0,3],
		[3,0,0,0,0,0,0,0,0,0,3],
		[3,0,0,0,0,3,3,3,1,0,3],
		[3,3,3,3,3,3,3,3,3,3,3],
	])
