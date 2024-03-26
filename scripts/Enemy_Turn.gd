extends Node

class_name Enemy_Turn

var start_position: Vector3 = Vector3(-9.5,1,-9.5)


func enemys_turn(parent: Node) -> void:
	for enemy: int in range(GlobalVar.enemies.size()):
		var move: String = find_shortest_path(GlobalVar.enemies[enemy])
		var enemy_node: Node3D = parent.get_child(enemy)
		var enemy_positions: Array = GlobalVar.enemies[enemy]
		
		if move == "N":
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 0
			GlobalVar.enemies[enemy] = [GlobalVar.enemies[enemy][0]-1,GlobalVar.enemies[enemy][1]]
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 2
			enemy_node.position = start_position + Vector3(enemy_positions[1], 0, enemy_positions[0]-1)
		elif  move == "S":
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 0
			GlobalVar.enemies[enemy] = [GlobalVar.enemies[enemy][0]+1,GlobalVar.enemies[enemy][1]]
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 2
			enemy_node.position = start_position + Vector3(enemy_positions[1], 0, enemy_positions[0]+1)
		elif move == "E":
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 0
			GlobalVar.enemies[enemy] = [GlobalVar.enemies[enemy][0],GlobalVar.enemies[enemy][1]-1]
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 2
			enemy_node.position = start_position + Vector3(enemy_positions[1]-1, 0, enemy_positions[0])
		elif move == "W":
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 0
			GlobalVar.enemies[enemy] = [GlobalVar.enemies[enemy][0],GlobalVar.enemies[enemy][1]+1]
			GlobalVar.Current_Room[GlobalVar.enemies[enemy][0]][GlobalVar.enemies[enemy][1]] = 2
			enemy_node.position = start_position + Vector3(enemy_positions[1]+1, 0, enemy_positions[0])
			

func find_shortest_path(enemy: Array) -> String:
	var player_found: bool = false
	var room_check: Array = GlobalVar.Current_Room.duplicate(true)
	var current_check: Array = [enemy]
	var next_check: Array = []
	var current_offset: int =  0
	var player_position: Array = [-1, -1]
	
	while !player_found:
		current_offset -= 1
		for check: Array in current_check:
			#check North
			if room_check[check[0]-1][check[1]] == 0 or room_check[check[0]-1][check[1]] == 1:
				if room_check[check[0]-1][check[1]] == 1:
					player_found = true
					player_position = [check[0]-1,check[1]]
					break
				room_check[check[0]-1][check[1]] = current_offset
				next_check.append([check[0]-1,check[1]])
			#check East
			if room_check[check[0]][check[1] + 1] == 0 or room_check[check[0]][check[1] + 1] == 1:
				if room_check[check[0]][check[1] + 1] == 1:
					player_found = true
					player_position = [check[0],check[1] + 1]
					break
				room_check[check[0]][check[1] + 1] = current_offset
				next_check.append([check[0],check[1] + 1])
			#check south
			if room_check[check[0] + 1][check[1]] == 0 or room_check[check[0] + 1][check[1]] == 1:
				if room_check[check[0] + 1][check[1]] == 1:
					player_found = true
					player_position = [check[0] + 1,check[1]]
					break
				room_check[check[0] + 1][check[1]] = current_offset
				next_check.append([check[0] + 1,check[1]])
			#check west
			if room_check[check[0]][check[1] - 1] == 0 or room_check[check[0]][check[1] - 1] == 1:
				if room_check[check[0]][check[1] - 1] == 1:
					player_found = true
					player_position = [check[0],check[1] - 1]
					break
				room_check[check[0]][check[1] - 1] = current_offset
				next_check.append([check[0],check[1] - 1])
		if player_found != true:				
			current_check = next_check
			next_check = []
			if current_check == []:
				return ""

	if current_offset == -1:
		hit_player()
		return ""
		
	while current_offset != -1:
		if room_check[player_position[0] - 1][player_position[1]] > current_offset and room_check[player_position[0] - 1][player_position[1]] < 0:
			player_position = [player_position[0] - 1, player_position[1]]
		elif room_check[player_position[0]][player_position[1]+1] > current_offset and room_check[player_position[0]][player_position[1]+1] < 0:
			player_position = [player_position[0], player_position[1] + 1]
		elif room_check[player_position[0] + 1][player_position[1]] > current_offset and room_check[player_position[0] + 1][player_position[1]] < 0:
			player_position = [player_position[0] + 1, player_position[1]]
		elif room_check[player_position[0]][player_position[1] -1] > current_offset and room_check[player_position[0]][player_position[1]-1] < 0:
			player_position = [player_position[0], player_position[1]-1]
		current_offset += 1
			
	if enemy[0] < player_position[0]:
		return "S"
	elif enemy[0] > player_position[0]:
		return "N"
	elif enemy[1] < player_position[1]:
		return "W"
	elif enemy[1] > player_position[1]:
		return "E"
	else:
		return ""
		
func hit_player():
	GlobalVar.player_health -= 1
	print(GlobalVar.player_health)
