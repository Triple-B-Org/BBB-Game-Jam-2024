class_name Wall_Gen


var Wall: PackedScene = preload("res://scenes/Environment/Wall.tscn")
var fountain_scene: PackedScene = preload("res://scenes/Environment/Fountain.tscn")
var pillar_scene: PackedScene = preload("res://scenes/Environment/Pillar.tscn")
var angel_scene: PackedScene = preload("res://scenes/Angel.tscn")

#generates walls
func generate_walls(parent: Node) -> void:
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	for row: int in range(array.size()):
		for col: int in range(one_row.size()):
			if array[row][col] == 3:
				var wall_instance: Node3D = Wall.instantiate()
				parent.add_child(wall_instance)
				wall_instance.position = start_position + Vector3(col, 0, row)
				wall_instance.set_mesh_and_objects(pack_neighbour_data(row, col, array.size(), one_row.size()))
			if array[row][col] == 4:
				var fountain: Node3D = fountain_scene.instantiate()
				parent.add_child(fountain)
				fountain.position = start_position + Vector3(col, -1, row)
			if array[row][col] == 7:
				var pillar: Node3D = pillar_scene.instantiate()
				parent.add_child(pillar)
				pillar.position = start_position + Vector3(col, -1, row)
			if array[row][col] == 8:
				var angel: Node3D = angel_scene.instantiate()
				parent.add_child(angel)
				angel.position = start_position + Vector3(col, 1.2, row)


func unload_walls(parent: Node) -> void:
	for n: Node in parent.get_children():
		parent.remove_child(n)
		n.queue_free()


func pack_neighbour_data(row: int, col: int, max_row: int, max_col: int) -> Vector4i:
	var neighbours: Vector4i = Vector4i.ONE
	if row != 0:
		neighbours.x = int(GlobalVar.Current_Room[row - 1][col] == 3)
	if row != max_row - 1:
		neighbours.y = int(GlobalVar.Current_Room[row + 1][col] == 3)
	if col != 0:
		neighbours.z = int(GlobalVar.Current_Room[row][col - 1] == 3)
	if col != max_col - 1:
		neighbours.w = int(GlobalVar.Current_Room[row][col + 1] == 3)
	return neighbours
