extends MeshInstance3D


func _on_player_done_moving(pos: Vector3) -> void:
	position = Vector3(pos.x, 0, pos.z)
