extends Camera3D

const SKY_SPEED: float = 0.01

var t: float = 0
var start_position: Vector3 = Vector3(0, 0, 3)

func _process(delta: float) -> void:
	environment.sky_rotation.x += SKY_SPEED * delta
	if GlobalVar.boss_intro:
		t = clamp((0.1 * delta) + t, 0, 1)
		position = start_position.lerp(Vector3.ZERO, t)
		if t == 1:
			GlobalVar.boss_intro = false
			$"../../UI".visible = true
			get_tree().paused = false
			get_parent_node_3d().activate_angel()
