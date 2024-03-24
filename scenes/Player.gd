extends CharacterBody3D


const SPEED = 5.0

var reset_rotation = global_transform.basis

func _physics_process(delta):

	if Input.is_action_just_pressed("ui_up"):
		if self.rotation_degrees.y == 0:
			self.position.z -= 1 
		elif self.rotation_degrees.y == 90:
			self.position.x -= 1 
		elif self.rotation_degrees.y == 180 or self.rotation_degrees.y == -180:
			self.position.z += 1 
		else:
			self.position.x += 1 
	elif Input.is_action_just_pressed("ui_down"):
		if self.rotation_degrees.y == 0:
			self.position.z += 1 
		elif self.rotation_degrees.y == 90:
			self.position.x += 1 
		elif self.rotation_degrees.y == 180 or self.rotation_degrees.y == -180:
			self.position.z -= 1 
		else:
			self.position.x -= 1 
	elif Input.is_action_just_pressed("ui_left"):
		rotate_y(deg_to_rad(90))
		if 0 == int(self.rotation_degrees.y):
			global_transform.basis = reset_rotation
	elif Input.is_action_just_pressed("ui_right"):
		rotate_y(-deg_to_rad(90))
		if 0 == int(self.rotation_degrees.y):
			global_transform.basis = reset_rotation
