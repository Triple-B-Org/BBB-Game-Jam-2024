extends MeshInstance3D


@onready var player: Node3D = $"../Player"
@export var eye: MeshInstance3D


func _process(_delta: float) -> void:
	eye.rotation.y = atan2(position.z - player.position.z, position.x - player.position.x)
