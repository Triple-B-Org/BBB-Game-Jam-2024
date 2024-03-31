extends Control

@export var start_game_scene: String

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready():
	audio_player.play()


func _on_decent_button_pressed():
	audio_player.stop()
	visible = false
	var _result: Error = get_tree().change_scene_to_file("res://scenes/Main.tscn")
