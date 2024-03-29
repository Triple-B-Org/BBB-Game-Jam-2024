class_name Enemy_Gen

var Enemy: PackedScene = preload("res://scenes/Enemy.tscn")

#generates walls
func generate_enemies(parent: Node) -> void:
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	for row: int in range(array.size()):
		for col: int in range(one_row.size()):
			if array[row][col] == 2:
				var enemy_instance: Node3D = Enemy.instantiate()
				parent.add_child(enemy_instance)
				enemy_instance.position = start_position + Vector3(col, 0, row)
				GlobalVar.enemies.append([row, col, 2])

func unload_enemies(parent: Node) -> void:
	for n: Node in parent.get_children():
		parent.remove_child(n)
		n.queue_free()
		GlobalVar.enemies = []
