extends Node3D


func _on_player_start_boss():
	$Angel.get_surface_override_material(0).emission_energy_multiplier = 0.2
