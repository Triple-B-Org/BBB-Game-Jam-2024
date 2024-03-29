extends Camera3D

const SKY_SPEED: float = 0.01

func _process(delta: float) -> void:
	environment.sky_rotation.x += SKY_SPEED * delta
