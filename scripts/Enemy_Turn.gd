extends Node3D

signal player_hit
signal enemy_moved

var start_position: Vector3 = Vector3(-9.5,1,-9.5)


func enemys_turn() -> void:
	if GlobalVar.player_actions != 3:
		return
	for enemy: int in range(get_children().size()):
		for actions: int in range(GlobalVar.enemies[enemy][3]):
			var enemy_pos: Array = [GlobalVar.enemies[enemy][0], GlobalVar.enemies[enemy][1]]
			var move: String = find_shortest_path(enemy_pos, GlobalVar.enemies[enemy][4], GlobalVar.enemies[enemy][5])
			var enemy_node: Node3D = get_child(enemy)
			var enemy_position: Vector2i = Vector2i(round(enemy_pos[0]), round(enemy_pos[1]))
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
			enemy_node.set_new_target(start_position + Vector3(enemy_position.y, 0, enemy_position.x))
	
	var _result: Error = emit_signal("enemy_moved")

func find_shortest_path(enemy: Array, number_range: int, damage: int) -> String:
	var player_found: bool = false
	var room_check: Array = GlobalVar.Current_Room.duplicate(true)
	var current_check: Array = [enemy]
	var next_check: Array = []
	var current_offset: int =  0
	var player_position: Array = [-1, -1]
	var line_check: bool = false
	var check_direction = -1;
	
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
		hit_player(damage)
		return ""
		
	if number_range > 1 and current_offset == -number_range:
		line_check = true
		check_direction = -1;
		
	while current_offset != -1:
		if room_check[player_position[0] - 1][player_position[1]] > current_offset and room_check[player_position[0] - 1][player_position[1]] < 0:
			player_position = [player_position[0] - 1, player_position[1]]
			if line_check == true:
				if check_direction != 0 and check_direction != -1:
					line_check = false
				check_direction = 0
		elif room_check[player_position[0]][player_position[1]+1] > current_offset and room_check[player_position[0]][player_position[1]+1] < 0:
			player_position = [player_position[0], player_position[1] + 1]
			if line_check == true:
				if check_direction != 1  and check_direction != -1:
					line_check = false
				check_direction = 1
		elif room_check[player_position[0] + 1][player_position[1]] > current_offset and room_check[player_position[0] + 1][player_position[1]] < 0:
			player_position = [player_position[0] + 1, player_position[1]]
			if line_check == true:
				if check_direction != 2  and check_direction != -1:
					line_check = false
				check_direction = 2
		elif room_check[player_position[0]][player_position[1] -1] > current_offset and room_check[player_position[0]][player_position[1]-1] < 0:
			player_position = [player_position[0], player_position[1]-1]
			if line_check == true:
				if check_direction != 3 and check_direction != -1:
					line_check = false
				check_direction = 3
		current_offset += 1
		
	if line_check == true:
		print(enemy)
		print("ranged hit")
		hit_player(damage)
		return ""
	
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


func hit_player(damage: int) -> void:
	GlobalVar.player_health -= damage
	var _result: Error = emit_signal("player_hit")


func _on_player_done_moving(_pos: Vector3) -> void:
	enemys_turn()
