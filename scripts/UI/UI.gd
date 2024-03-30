extends Control


signal pause_menu_reset


@export var pause_menu: Control


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause_game"):
		toggle_pause()


func toggle_pause() -> void:
	pause_menu.visible = not pause_menu.visible
	get_tree().paused = pause_menu.visible
	var _result: Error = emit_signal("pause_menu_reset")


func _on_continue_button_pressed() -> void:
	toggle_pause()
