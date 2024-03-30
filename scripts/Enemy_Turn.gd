extends Node3D

signal player_hit
signal enemy_moved

var start_position: Vector3 = Vector3(-9.5,1,-9.5)


func enemys_turn(parent: Node) -> void:
	for enemy: int in range(parent.get_children().size()):
		var enemy_pos: Array = [GlobalVar.enemies[enemy][0], GlobalVar.enemies[enemy][1]]
		var move: String = find_shortest_path(enemy_pos)
		var enemy_node: Node3D = parent.get_child(enemy)
		var enemy_position: Vector2i = Vector2i(enemy_pos[0], enemy_pos[1])
		var direction: Vector2i =  Vector2i.ZERO
		
		if move == "N":
			direction.x = -1
		elif  move == "S":
			direction.x = 1
		elif move == "E":
			direction.y = -1
		elif move == "W":
			direction.y = 1
		
		GlobalVar.Current_Room[enemy_position.x][enemy_position.y] = 0
		enemy_position += direction
		GlobalVar.enemies[enemy][0] = enemy_position.x
		GlobalVar.enemies[enemy][1] = enemy_position.y
		GlobalVar.Current_Room[enemy_position.x][enemy_position.y] = 2
		enemy_node.position = start_position + Vector3(enemy_position.y, 0, enemy_position.x)
	
	var _result: Error = emit_signal("enemy_moved")


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


func hit_player() -> void:
	GlobalVar.player_health -= 1
	var _result: Error = emit_signal("player_hit")
