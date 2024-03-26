class_name Map_Gen

var world_map: Array = []
var row_index: int

func load_map() -> void:
	# Initialize world_map with appropriate size
	for row_index in range(4):
		var row = []
		for column_index in range(4):
			row.append(column_index)
		world_map.append(row)	
	print(world_map)
	
	# Fill first row with fight rooms
	for column_index in range(4):
		world_map[0][column_index] = 1
	print(world_map)
	
	# Define the weights for choosing fights and rests
	var fight_weight = 3  # Adjust this value to increase or decrease the likelihood of picking fight
	var rest_weight = 1  # Adjust this value to increase or decrease the likelihood of picking rest

	# Fill the rest of the matrix with random numbers between 1 and 2, based on weights
	for row_index in range(1, 4):  # Start from the second row
		for column_index in range(4):
			var random_room_value = randi() % (fight_weight + rest_weight)
			if random_room_value < fight_weight:
				world_map[row_index][column_index] = 1
			else:
					world_map[row_index][column_index] = 2
	print(world_map)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	load_map()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
