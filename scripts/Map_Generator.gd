extends Node
class_name Map_Gen


func initialize_map() -> void:
	GlobalVar.selectable_rooms = []
	# Define the weights for choosing fights and rests
	while GlobalVar.selectable_rooms.size() < 3:
		if GlobalVar.num_rooms_visited % 10 == 0:
				GlobalVar.selectable_rooms.append(3)
		else:
			var fight_weight: int = 4  # Adjust this value to increase or decrease the likelihood of picking fight
			var rest_weight: int = 1  # Adjust this value to increase or decrease the likelihood of picking rest
			var random_room_value: int = randi() % (fight_weight + rest_weight)
			if random_room_value < fight_weight:
				GlobalVar.selectable_rooms.append(1)
			else:
				GlobalVar.selectable_rooms.append(2)
	
	print(GlobalVar.selectable_rooms)


func reset_selectable_rooms() -> void:
	var _result: int = GlobalVar.selectable_rooms.resize(0)
	print(GlobalVar.selectable_rooms)


func get_left_option() -> int:
	print(GlobalVar.selectable_rooms)
	var left_room: int = GlobalVar.selectable_rooms[0]
	GlobalVar.num_rooms_visited += 1
	print(GlobalVar.num_rooms_visited)
	return left_room


func get_middle_option() -> int:
	var middle_room: int = GlobalVar.selectable_rooms[1]
	GlobalVar.num_rooms_visited += 1
	print(GlobalVar.num_rooms_visited)
	return middle_room


func get_right_option() -> int:
	var right_room: int = GlobalVar.selectable_rooms[2]
	GlobalVar.num_rooms_visited += 1
	print(GlobalVar.num_rooms_visited)
	return right_room
