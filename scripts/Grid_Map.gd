class_name Grid_Map

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

#THIS IS ONLY FOR TESTING FOR N0W, NEEDS TO BE MADE DINAMIC, ADDED TO MY LIST (KELAN)
var fight_rooms = []
var rest_rooms = []
	
# Returns a random room to be generated
func get_random_fight_room() -> void:
	rng.randomize()
	if fight_rooms == []:
		load_fight_rooms()
	var random_room = rng.randf_range(0, fight_rooms.size())
	GlobalVar.Current_Room = fight_rooms[random_room]
	fight_rooms.pop_at(random_room)

func get_random_rest_room() -> void:
	rng.randomize()
	if rest_rooms == []:
		load_rest_rooms()
	var random_room = rng.randf_range(0, rest_rooms.size())
	GlobalVar.Current_Room = rest_rooms[random_room]
	rest_rooms.pop_at(random_room)

#this function is for putting in your room layouts
func load_fight_rooms() -> void:
	fight_rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3],
		[3,3,3,0,2,0,3,0,0,3,3],
		[3,3,0,0,0,0,0,0,0,3,3],
		[3,3,0,0,3,3,3,3,0,3,3],
		[3,3,3,0,3,3,3,3,2,0,3],
		[3,3,3,0,3,3,3,3,0,0,3],
		[3,3,3,0,3,3,3,3,0,0,3],
		[3,0,2,0,0,0,0,0,0,0,3],
		[3,0,0,0,0,3,3,3,1,0,3],
		[3,3,3,3,3,3,3,3,3,3,3],
	])
	
	fight_rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,3],
		[3,3,3,3,3,3,3,3,0,3,3,0,0,2,0,3],
		[3,0,0,0,3,3,3,3,0,3,3,0,0,0,0,3],
		[3,0,2,0,0,0,0,0,0,0,0,0,3,3,3,3],
		[3,0,0,3,0,3,0,0,3,3,3,0,3,3,3,3],
		[3,0,0,3,0,3,0,0,3,3,3,0,3,3,3,3],
		[3,0,0,0,0,0,0,0,0,2,0,0,3,3,3,3],
		[3,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,0,1,0,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
	])
	
	fight_rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,0,0,2,0,0,3,3,3,0,3,3,3,3,3],
		[3,0,0,3,0,0,3,3,3,0,3,3,3,3,3],
		[3,0,3,3,3,0,0,0,0,0,0,0,0,0,3],
		[3,0,0,3,0,0,3,3,3,0,3,3,3,0,3],
		[3,0,0,0,0,0,3,3,3,0,3,3,3,0,3],
		[3,3,3,3,3,0,3,3,3,0,3,3,3,0,3],
		[3,3,3,3,3,0,3,0,0,0,0,0,0,0,3],
		[3,3,3,3,3,0,3,3,3,3,3,3,3,0,3],
		[3,3,3,3,0,0,0,3,3,3,3,3,3,0,3],
		[3,3,3,3,0,3,0,0,0,2,0,0,3,0,3],
		[3,3,3,3,1,0,0,3,3,3,3,0,0,0,3],
		[3,3,3,3,3,3,3,3,3,3,3,3,0,0,3],
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
	])
	
	fight_rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,0,2,3,3,0,0,0,0,0,0,3,3,3,3],
		[3,0,3,3,3,0,3,3,3,3,0,0,3,3,3],
		[3,0,3,3,0,0,0,3,3,3,0,0,2,3,3],
		[3,0,0,0,0,0,0,3,3,3,0,3,3,3,3],
		[3,0,0,3,3,0,3,3,0,0,0,0,0,0,3],
		[3,1,0,3,3,0,3,3,0,3,3,0,3,0,3],
		[3,3,3,3,3,0,0,0,0,3,2,0,3,0,3],
		[3,3,3,3,3,3,3,3,0,0,0,0,0,0,3],
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
	])
	
	fight_rooms.append([
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
		[3,0,0,0,0,0,0,0,0,0,0,0,3,0,0,0,3],
		[3,0,0,3,3,3,0,0,0,0,0,0,3,0,0,0,3],
		[3,0,0,3,3,0,0,0,3,3,3,0,0,0,0,0,3],
		[3,0,0,0,0,0,0,0,0,2,3,0,0,3,3,0,3],
		[3,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,3],
		[3,0,2,3,3,0,0,0,0,0,0,0,3,0,0,0,3],
		[3,0,0,3,3,0,0,0,0,0,0,0,3,0,1,0,3],
		[3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3],
	])

func load_rest_rooms() -> void:
	rest_rooms.append([
		[3,3,3,3,3,3,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,0,0,0,3],
		[3,0,3,0,3,0,3],
		[3,0,0,1,0,0,3],
		[3,3,3,3,3,3,3]
	]);
