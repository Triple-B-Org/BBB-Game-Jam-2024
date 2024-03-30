extends Node3D

@onready var player: Node3D = $"../../Player"
@export var enemy: MeshInstance3D

var time: float = 0


func _process(_delta: float) -> void:
	enemy.rotation.y = -atan2(position.z - player.position.z, position.x - player.position.x)
	time += 0.05
	position.y = (sin(time) / 7 + 0.9)

