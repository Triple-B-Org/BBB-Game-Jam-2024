extends Node

class_name Enemy_Move

var player_found: bool = false

func enemys_turn() -> void:
	for enemy: Array in GlobalVar.enemies:
		print(find_shortest_path(enemy))
		player_found = false

func find_shortest_path(enemy: Array) -> String:
	var room_check: Array = GlobalVar.Current_Room.copy()
	var current_check: Array = [enemy]
	var next_check: Array = []
	var current_offset: int =  0
	var player_position: Array = [-1, -1]

	
	while !player_found:
		current_offset -= 1
		for check: Array in current_check:
			if room_check[check[0]-1][check[1]] == 0 or room_check[check[0]-1][check[1]] == 1:
				if room_check[check[0]-1][check[1]] == 1:
					player_found = true
					player_position = [check[0]-1,check[1]]
					break
				room_check[check[0]-1][check[1]] = current_offset
				next_check.append([check[0]-1,check[1]])
			if room_check[check[0]][check[1] + 1] == 0 or room_check[check[0]][check[1] + 1] == 1:
				if room_check[check[0]][check[1] + 1] == 1:
					player_found = true
					player_position = [check[0],check[1] + 1]
					break
				room_check[check[0]][check[1] + 1] = current_offset
				next_check.append([check[0],check[1] + 1])
			if room_check[check[0] + 1][check[1]] == 0 or room_check[check[0] + 1][check[1]] == 1:
				if room_check[check[0] + 1][check[1]] == 1:
					player_found = true
					player_position = [check[0] + 1,check[1]]
					break
				room_check[check[0] + 1][check[1]] = current_offset
				next_check.append([check[0] + 1,check[1]])
			if room_check[check[0]][check[1] - 1] == 0 or room_check[check[0]][check[1] - 1] == 1:
				if room_check[check[0]][check[1] - 1] == 1:
					player_found = true
					player_position = [check[0],check[1] - 1]
					break
				room_check[check[0]][check[1] - 1] = current_offset
				next_check.append([check[0],check[1] - 1])
		current_check = next_check
		next_check = []

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
		return "N"
	if enemy[0] > player_position[0]:
		return "S"
	if enemy[1] < player_position[1]:
		return "W"
	else:
		return "E"
