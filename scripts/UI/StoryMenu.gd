extends Control

@export var start_game_scene: String

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.play()
	pass # Replace with function body.

func _on_decent_button_pressed():
	audio_player.stop()
	self.visible = false
	var _result: Error = get_tree().change_scene_to_file("res://scenes/Main.tscn")
	pass # Replace with function body.
