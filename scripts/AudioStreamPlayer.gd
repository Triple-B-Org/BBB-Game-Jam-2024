extends AudioStreamPlayer


@export var sounds: Array[AudioStreamWAV]


func _on_timer_timeout() -> void:
	if randi() % 10 == 0:
		if !playing:
			stream = sounds[randi_range(0, sounds.size() - 1)]
			play()
