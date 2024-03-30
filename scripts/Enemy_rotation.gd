extends Node3D

@onready var player: Node3D = $"../../Player"
@export var enemy: MeshInstance3D

func _process(_delta: float) -> void:
	enemy.rotation.y = -atan2(position.z - player.position.z, position.x - player.position.x)
	
	
