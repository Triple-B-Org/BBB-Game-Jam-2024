extends MeshInstance3D


var time: float = 0


func _process(_delta: float) -> void:
	time += 0.01
	get_surface_override_material(0).emission_energy_multiplier = (sin(time) + 1) / 2
