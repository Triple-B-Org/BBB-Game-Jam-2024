class_name Enemy_Gen


var Enemy: PackedScene = preload("res://scenes/Enemy.tscn")

#generates walls
func generate_enemies(caller: Node) -> void:
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	for row: int in range(array.size()):
		for col: int in range(one_row.size()):
			if array[row][col] == 2:
				var enemy_instance: Node3D = Enemy.instantiate()
				caller.add_child(enemy_instance)
				enemy_instance.position = start_position + Vector3(col, 0, row)

func unload_enemies(caller: Node):
	for n in caller.get_children():
		caller.remove_child(n)
		n.queue_free()
