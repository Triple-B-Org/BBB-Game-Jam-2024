extends MeshInstance3D


@onready var player: Node3D = $"../../Player"
@export var eye: MeshInstance3D


func _process(_delta: float) -> void:
	if player != null:
		eye.rotation.y = -atan2(position.z - player.position.z, position.x - player.position.x)
	if Input.is_action_just_pressed("hit"):
		if player.position.distance_to(position) < 1.5:
			if GlobalVar.player_health == GlobalVar.player_max_health:
				GlobalVar.player_max_health += 1
				GlobalVar.player_health = GlobalVar.player_max_health
			else:
				GlobalVar.player_health += 1
			$"../../UI"._on_player_reset_health()
			GlobalVar.players_turn = 0
			$"../../UI".open_map_menu()
