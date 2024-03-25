extends CharacterBody3D

#player stats
var max_actions: int = 3;
var actions: int = 3;
var max_health: int = 3;
var health: int = 3;

const SPEED: float = 5

var direction: Vector2 = Vector2.DOWN

#GABOR the direction values where unreliable for checking on the grid, Im sorry
var facing: String = "N"

# required for smooth movements
var start_position: Vector3 = Vector3.ZERO
var end_position: Vector3 = Vector3.ZERO
var t_movement: float = 1
var start_rotation: float = 0
var end_rotation: float = 0
var t_rotation: float = 1

# grid GlobalVar.Current_Room tracking
var grid_x: int = -1
var grid_y: int = -1


func _physics_process(delta: float) -> void:
	if Settings.smooth_movement:
		if t_movement >= 1 and t_rotation >= 1:
			if Input.is_action_just_pressed("move_forward"):
				if check_move_forward() == true:
					start_position = position
					end_position = start_position - Vector3(direction.x, 0, direction.y)
					t_movement = 0
			elif Input.is_action_just_pressed("move_backward"):
				if check_move_backward() == true:
					start_position = position
					end_position = start_position + Vector3(direction.x, 0, direction.y)
					t_movement = 0
			elif Input.is_action_just_pressed("turn_right"):
				start_rotation = rotation.y
				end_rotation = start_rotation - PI/2
				direction = Vector2(sin(end_rotation), cos(end_rotation))
				t_rotation = 0
				
				if facing == "N":
					facing = "E"
				elif facing == "E":
					facing = "S"
				elif facing == "S":
					facing = "W"
				else:
					facing = "N"
			elif Input.is_action_just_pressed("turn_left"):
				start_rotation = rotation.y
				end_rotation = start_rotation + PI/2
				direction = Vector2(sin(end_rotation), cos(end_rotation))
				t_rotation = 0
				
				if facing == "N":
					facing = "W"
				elif facing == "E":
					facing = "N"
				elif facing == "S":
					facing = "E"
				else:
					facing = "S"
		# only rotation or movement is allowed at a time
		elif t_rotation >= 1:
			t_movement += SPEED * delta
			position = start_position.lerp(end_position, t_movement)
		elif t_movement >= 1:
			t_rotation += SPEED * delta
			rotation.y = lerp(start_rotation, end_rotation, t_rotation)
		# however if for some reason both are activated they are both moved to their end positions
		else:
			t_movement = 1
			position = start_position.lerp(end_position, t_movement)
			t_rotation = 1
			rotation.y = lerp(start_rotation, end_rotation, t_rotation)
	else:
		if Input.is_action_just_pressed("move_forward"):
			if check_move_forward() == true:
				position.x -= direction.x
				position.z -= direction.y
		elif Input.is_action_just_pressed("move_backward"):
			if check_move_backward() == true:
				position.x += direction.x
				position.z += direction.y
		elif Input.is_action_just_pressed("turn_right"):
			rotation.y -= PI/2
			direction = Vector2(sin(rotation.y), cos(rotation.y))
			if facing == "N":
					facing = "E"
			elif facing == "E":
				facing = "S"
			elif facing == "S":
				facing = "W"
			else:
				facing = "N"
		elif Input.is_action_just_pressed("turn_left"):
			rotation.y += PI/2
			direction = Vector2(sin(rotation.y), cos(rotation.y))
			if facing == "N":
				facing = "W"
			elif facing == "E":
				facing = "N"
			elif facing == "S":
				facing = "E"
			else:
				facing = "S"


func check_move_forward() -> bool:
	var can_move: bool = false

	if facing == "N" and GlobalVar.Current_Room[grid_y - 1][grid_x] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y - 1][grid_x] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_y -= 1
	elif facing == "E" and GlobalVar.Current_Room[grid_y][grid_x + 1] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y][grid_x + 1] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_x += 1
	elif facing == "S" and GlobalVar.Current_Room[grid_y + 1][grid_x] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y + 1][grid_x] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_y += 1
	elif facing == "W" and GlobalVar.Current_Room[grid_y][grid_x - 1] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y][grid_x - 1] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_x -= 1

	return can_move


func check_move_backward() -> bool:
	var can_move: bool = false

	if facing == "N" and GlobalVar.Current_Room[grid_y + 1][grid_x] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y + 1][grid_x] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_y += 1
	elif facing == "E" and GlobalVar.Current_Room[grid_y][grid_x - 1] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y][grid_x - 1] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_x -= 1
	elif facing == "S" and GlobalVar.Current_Room[grid_y - 1][grid_x] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y - 1][grid_x] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_y -= 1
	elif facing == "W" and GlobalVar.Current_Room[grid_y][grid_x + 1] == 0:
		can_move = true
		GlobalVar.Current_Room[grid_y][grid_x + 1] = 1
		GlobalVar.Current_Room[grid_y][grid_x] = 0
		grid_x += 1
		
	return can_move


func spawn_player(grid: Array) -> void:
	GlobalVar.Current_Room = grid
	var start_position_2: Vector3 = Vector3(-9.5,1,-9.5)
	var grid_row: Array = grid[0]
	for row: int in range(grid.size()):
		for col: int in range(grid_row.size()):
			if grid[row][col] == 1:
				grid_x = col
				grid_y = row
				position = start_position_2 + Vector3(col, 0, row)
