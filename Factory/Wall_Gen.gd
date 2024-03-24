class_name Wall_Gen


var Wall: PackedScene = preload("res://scenes/Wall.tscn")

#generates walls
func generate_walls(caller: Node, array: Array) -> void:
	var start_position: Vector3 = Vector3(-10,0,10)
	var test = ""
	for row in range(array.size()):
		for col in range(array[0].size()):
			if array[row][col] == 3:
				var wall_instance = Wall.instantiate()
				caller.add_child(wall_instance)
				print(wall_instance.get_parent().name)
				wall_instance.position = start_position + Vector3(col, 0, -row)
				
				print(wall_instance)
				print(start_position + Vector3(col, 0, -row))
			test += str(array[row][col]) + " "
		print(test)
		test = ""
