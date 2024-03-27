extends VideoStreamPlayer


@export var boot_picture: TextureRect
@export var end_timer: Timer
@export var main_menu: PackedScene


func _process(_delta: float) -> void:
	if not paused and stream_position >= 1.8:
		boot_picture.texture = ImageTexture.create_from_image(get_video_texture().get_image())
		end_timer.start()
		stop()

func _on_timer_timeout() -> void:
	play()


func _on_end_timer_timeout() -> void:
	var _result: Error = get_tree().change_scene_to_packed(main_menu)
