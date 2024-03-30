extends Node


var smooth_movement: bool = true
var move_speed: float = 5.0


var fullscreen: bool = false
var resolution_index: int = 4


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()
