class_name Map_Gen


var world_map: Array = []


func load_map() -> void:
	# Initialize world_map with appropriate size
	for row_index: int in range(4):
		var row: Array = []
		for column_index: int in range(4):
			row.append(column_index)
		world_map.append(row)	
	print(world_map)

	# Fill first row with fight rooms
	for column_index: int in range(4):
		world_map[0][column_index] = 1
	print(world_map)

	# Define the weights for choosing fights and rests
	var fight_weight: int = 3  # Adjust this value to increase or decrease the likelihood of picking fight
	var rest_weight: int = 1  # Adjust this value to increase or decrease the likelihood of picking rest

	# Fill the rest of the matrix with random numbers between 1 and 2, based on weights
	for row_index: int in range(1, 4):  # Start from the second row
		for column_index: int in range(4):
			var random_room_value: int = randi() % (fight_weight + rest_weight)
			if random_room_value < fight_weight:
				world_map[row_index][column_index] = 1
			else:
				world_map[row_index][column_index] = 2
	print(world_map)


func _ready() -> void:
	load_map()
