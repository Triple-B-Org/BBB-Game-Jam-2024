extends Control


signal continue_game
signal set_options_2


@export var main_menu_scene: String
@export var pause_menu_ui: Control
@export var settings_menu_ui: Control


func _on_settings_button_pressed() -> void:
	pause_menu_ui.visible = false
	settings_menu_ui.visible = true
	var _result: Error = emit_signal("set_options_2")


func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	var _result: Error = get_tree().change_scene_to_file(main_menu_scene)


func _on_back_button_pressed() -> void:
	pause_menu_ui.visible = true
	settings_menu_ui.visible = false


func _on_continue_button_pressed() -> void:
	var _result: Error = emit_signal("continue_game")


func _on_ui_pause_menu_reset() -> void:
	pause_menu_ui.visible = true
	settings_menu_ui.visible = false
