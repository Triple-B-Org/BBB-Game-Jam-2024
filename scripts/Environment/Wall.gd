extends Node3D


@export var wall_plane: PackedScene
@export var scattered_items: Array[PackedScene]


func set_mesh_and_objects(neighbours: Vector4i) -> void:
	if neighbours.x != 1:
		spawn_wall(PI / 2)
	if neighbours.y != 1:
		spawn_wall(PI * 1.5)
	if neighbours.z != 1:
		spawn_wall(PI)
	if neighbours.w != 1:
		spawn_wall(0)


func spawn_wall(rotation_radian: float) -> void:
	var wall_plane_instance: MeshInstance3D = wall_plane.instantiate()
	add_child(wall_plane_instance)
	if randi() % 4 == 0:
		var spawn_item: MeshInstance3D = scattered_items[randi_range(0, scattered_items.size() - 1)].instantiate()
		wall_plane_instance.add_child(spawn_item)
	wall_plane_instance.rotation.y = rotation_radian
