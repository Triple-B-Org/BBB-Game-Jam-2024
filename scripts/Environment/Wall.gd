extends Node3D


@onready var wall_plane: PackedScene = preload("res://scenes/Environment/WallPlane.tscn")
@onready var pot: PackedScene = preload("res://scenes/Environment/Pot.tscn")
@onready var suzanne: PackedScene = preload("res://scenes/Environment/Suzanne.tscn")
@onready var sword: PackedScene = preload("res://scenes/Environment/Sword.tscn")
@onready var torch: PackedScene = preload("res://scenes/Environment/Torch.tscn")


func set_mesh_and_objects(neighbours: Vector4i) -> void:
	var wall_plane_instance: MeshInstance3D
	if neighbours.x != 1:
		wall_plane_instance = wall_plane.instantiate()
		add_child(wall_plane_instance)
		wall_plane_instance.rotation.y = PI / 2
	if neighbours.y != 1:
		wall_plane_instance = wall_plane.instantiate()
		add_child(wall_plane_instance)
		wall_plane_instance.rotation.y = PI * 1.5
	if neighbours.z != 1:
		wall_plane_instance = wall_plane.instantiate()
		add_child(wall_plane_instance)
		wall_plane_instance.rotation.y = PI
	if neighbours.w != 1:
		wall_plane_instance = wall_plane.instantiate()
		add_child(wall_plane_instance)
	
	
