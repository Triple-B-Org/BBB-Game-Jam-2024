extends Node3D

@onready var player: Node3D = $"../../Player"
@export var enemy: MeshInstance3D
@export var enemy_type: CompressedTexture2D

@export var bobbing_speed: float
@export var bobbing_range: float = 1
@export var bobbing_center: float

var time: float = 0

var t: float = 1
var start_position: Vector3
var end_position: Vector3



func _process(delta: float) -> void:
	enemy.rotation.y = -atan2(position.z - player.position.z, position.x - player.position.x)
	time += bobbing_speed
	enemy.position.y = (sin(time) / bobbing_range + bobbing_center)
	
	if t < 1:
		t = clamp((1 * delta) + t, 0, 1)
		position = start_position.lerp(end_position, t)


func update_health() -> void:
	$MeshInstance3D/EnemyHUD/HealthText.text = str(GlobalVar.enemies[get_index()][2])


func set_new_target(new_target: Vector3) -> void:
	start_position = position
	end_position = new_target
	t = 0
