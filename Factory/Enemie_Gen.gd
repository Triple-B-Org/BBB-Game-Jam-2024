class_name Enemy_Gen

var Cultist: PackedScene = preload("res://scenes/Cultist.tscn")
var Flesh_blob: PackedScene = preload("res://scenes/Flesh_blob.tscn")

var rand: RandomNumberGenerator = RandomNumberGenerator.new()
#generates walls
func generate_enemies(parent: Node) -> void:
	var enemy_choice: int
	var enemy_instance: Node3D
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	var array: Array = GlobalVar.Current_Room
	var one_row: Array = array[0]
	if !GlobalVar.boss_room:
		for row: int in range(array.size()):
			for col: int in range(one_row.size()):
				if array[row][col] == 2:
					rand.randomize()
					
					#this is used to check what enemies should spawn based on how far the player has gone
					if GlobalVar.num_rooms_visited <= 2:
						enemy_choice = 0
					else:
						enemy_choice = rand.randi_range(0,1)
					
					#this is the enemies, more can be added the same way
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
					enemy_instance.update_health()
	else:
		for row: int in range(array.size()):
			for col: int in range(one_row.size()):
				if array[row][col] == 7 and array[row + 1][col] == 0:
					rand.randomize()
					enemy_choice = rand.randi_range(0,1)
					#this is the basic enemy, more can be added the same way
					if enemy_choice == 0:
						enemy_instance = Cultist.instantiate()
						#[x, y, health, actions, range, damage]
						GlobalVar.enemies.append([row + 1, col, 2, 1, 1, 1])
						
					else:
						enemy_instance = Flesh_blob.instantiate()
						#[x, y, health, actions, range, damage]
						GlobalVar.enemies.append([row + 1, col, 3, 1, 1, 1])
					parent.add_child(enemy_instance)
					enemy_instance.position = start_position + Vector3(col, 0, row + 1)
					enemy_instance.update_health()


func unload_enemies(parent: Node) -> void:
	for n: Node in parent.get_children():
		parent.remove_child(n)
		n.queue_free()
		GlobalVar.enemies = []

