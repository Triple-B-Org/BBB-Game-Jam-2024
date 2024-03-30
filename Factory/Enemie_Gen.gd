class_name Enemy_Gen

var Cultist: PackedScene = preload("res://scenes/Cultist.tscn")
var Flesh_blob: PackedScene = preload("res://scenes/Flesh_blob.tscn")

var rand: RandomNumberGenerator = RandomNumberGenerator.new()
#generates walls
func generate_enemies(parent: Node) -> void:
	var enemy_instance: Node3D
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	for row: int in range(array.size()):
		for col: int in range(one_row.size()):
			if array[row][col] == 2:
				rand.randomize()
				var enemy_choice = rand.randi_range(0,1)
				#this is the basic enemy, more can be added the same way
				if enemy_choice == 0:
					enemy_instance = Cultist.instantiate()
					#[x, y, health, actions, range, damage]
					GlobalVar.enemies.append([row, col, 2, 1, 1, 1])
					
				else:
					enemy_instance = Flesh_blob.instantiate()
					#[x, y, health, actions, range, damage]
					GlobalVar.enemies.append([row, col, 3, 1, 1, 1])
				parent.add_child(enemy_instance)
				enemy_instance.position = start_position + Vector3(col, 0, row)
					
func unload_enemies(parent: Node) -> void:
	for n: Node in parent.get_children():
		parent.remove_child(n)
		n.queue_free()
		GlobalVar.enemies = []
