extends Control

@onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_fail_button_pressed() -> void:
	audio_player.stop()
	self.visible = false
	var _result = get_tree().change_scene_to_file("res://scenes/UI/MainMenu.tscn")
