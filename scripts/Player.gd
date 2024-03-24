extends CharacterBody3D

const SPEED: float = 5

var direction: Vector2 = Vector2.DOWN

# required for smooth movements
var start_position: Vector3 = Vector3.ZERO
var end_position: Vector3 = Vector3.ZERO
var t_movement: float = 1
var start_rotation: float = 0
var end_rotation: float = 0
var t_rotation: float = 1


func _physics_process(delta: float) -> void:
	if Settings.smooth_movement:
		if t_movement >= 1 and t_rotation >= 1:
			if Input.is_action_just_pressed("move_forward"):
				start_position = position
				end_position = start_position - Vector3(direction.x, 0, direction.y)
				t_movement = 0
			elif Input.is_action_just_pressed("move_backward"):
				start_position = position
				end_position = start_position + Vector3(direction.x, 0, direction.y)
				t_movement = 0
			elif Input.is_action_just_pressed("turn_right"):
				start_rotation = rotation.y
				end_rotation = start_rotation - PI/2
				direction = Vector2(sin(end_rotation), cos(end_rotation))
				t_rotation = 0
			elif Input.is_action_just_pressed("turn_left"):
				start_rotation = rotation.y
				end_rotation = start_rotation + PI/2
				direction = Vector2(sin(end_rotation), cos(end_rotation))
				t_rotation = 0
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
			position.x -= direction.x
			position.z -= direction.y
		elif Input.is_action_just_pressed("move_backward"):
			position.x += direction.x
			position.z += direction.y
		elif Input.is_action_just_pressed("turn_right"):
			rotation.y -= PI/2
			direction = Vector2(sin(rotation.y), cos(rotation.y))
		elif Input.is_action_just_pressed("turn_left"):
			rotation.y += PI/2
			direction = Vector2(sin(rotation.y), cos(rotation.y))
			
func check_move_forward():
	print($Grid_Map.Current_Room)
	
func check_move_backward():
	print($Grid_Map.Current_Room)
	
func spawn_player(grid: Array):
	var start_position: Vector3 = Vector3(-9.5,1,-9.5)
	for row in range(grid.size()):
		for col in range(grid[0].size()):
			if grid[row][col] == 1:
				position = start_position + Vector3(col, 0, row);
