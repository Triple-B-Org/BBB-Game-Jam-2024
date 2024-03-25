class_name Grid_Map

#THIS IS ONLY FOR TESTING FOR N0W, NEEDS TO BE MADE DINAMIC, ADDED TO MY LIST (KELAN)
var Rooms: Array = []
	
# Returns a random room to be generated
func get_random_room() -> void:
	GlobalVar.Current_Room = Rooms[randi() % Rooms.size()]

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
