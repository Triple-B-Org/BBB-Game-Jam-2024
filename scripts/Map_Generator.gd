class_name Map_Gen

var num_rooms_visited: int = 0
var selectable_rooms: Array = []

func initialize_map() -> void:
	# Define the weights for choosing fights and rests
	while selectable_rooms.size() != 3:
		if num_rooms_visited % 5 == 0 && num_rooms_visited != 0:
			selectable_rooms.append(3)
		var fight_weight: int = 3  # Adjust this value to increase or decrease the likelihood of picking fight
		var rest_weight: int = 1  # Adjust this value to increase or decrease the likelihood of picking rest
		var random_room_value: int = randi() % (fight_weight + rest_weight)
		if random_room_value < fight_weight:
			selectable_rooms.append(1)
		else:
			selectable_rooms.append(2)
	print(selectable_rooms)

func reset_selectable_rooms() -> void:
	var _result: int = selectable_rooms.resize(0)
	print(selectable_rooms)
	
func get_left_option() -> int:
	var left_room: int = selectable_rooms[0]
	return left_room

func get_middle_option() -> int:
	var middle_room: int = selectable_rooms[1]
	return middle_room
	
func get_right_option() -> int:
	var right_room: int = selectable_rooms[2]
	return right_room
	
func _ready() -> void:
	initialize_map()
