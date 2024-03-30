extends Node3D

@onready var player: Node3D = $"../../Player"
@export var enemy: MeshInstance3D
@export var enemy_type: CompressedTexture2D

var time: float = 0

func _ready() -> void:
	$MeshInstance3D/EnemyHUD/TypeImage.texture = enemy_type

func _process(_delta: float) -> void:
	enemy.rotation.y = -atan2(position.z - player.position.z, position.x - player.position.x)
	time += 0.03
	position.y = (sin(time) / 7 + 0.75)


func update_health() -> void:
	$MeshInstance3D/EnemyHUD/HealthText.text = str(GlobalVar.enemies[get_index()][2])
