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


func _on_enemies_player_hit() -> void:
	$PlayerHUD/HealthContainer.update_health()


func _on_player_reset_health() -> void:
	$PlayerHUD/HealthContainer.reset_health()


func _on_player_player_moved() -> void:
	$PlayerHUD/Turns.update_turns()


func _on_enemies_enemy_moved():
	$PlayerHUD/Turns.reset_turns()
