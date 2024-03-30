class_name Wall_Gen


var Wall: PackedScene = preload("res://scenes/Wall.tscn")

#generates walls
func generate_walls(parent: Node) -> void:
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	for row: int in range(array.size()):
		for col: int in range(one_row.size()):
			if array[row][col] == 3:
				var wall_instance: MeshInstance3D = Wall.instantiate()
				parent.add_child(wall_instance)
				wall_instance.position = start_position + Vector3(col, 0, row)


func unload_walls(parent: Node) -> void:
	for n: Node in parent.get_children():
		parent.remove_child(n)
		n.queue_free()
