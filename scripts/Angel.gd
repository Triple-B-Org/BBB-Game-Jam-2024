extends MeshInstance3D


var move_speed: float = 2


func _ready():
	$AudioStreamPlayer3D.play()

func _process(delta: float) -> void:
	get_surface_override_material(0).uv1_offset.x += delta * move_speed
