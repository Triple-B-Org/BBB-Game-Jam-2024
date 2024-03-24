class_name Wall_Gen


var Wall: PackedScene = preload("res://scenes/Wall.tscn")

#generates walls
func generate_walls(caller: Node, array: Array) -> void:
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	
	for row in range(array.size()):
		for col in range(array[0].size()):
			if array[row][col] == 3:
				var wall_instance = Wall.instantiate()
				caller.add_child(wall_instance)
				wall_instance.position = start_position + Vector3(col, 0, row)
