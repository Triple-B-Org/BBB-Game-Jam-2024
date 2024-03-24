extends Control

@export var main_menu_scene: String

@export var pause_menu_ui: Control
@export var settings_menu_ui: Control


func _on_settings_button_pressed() -> void:
	pause_menu_ui.visible = false
	settings_menu_ui.visible = true


func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	var _result: Error = get_tree().change_scene_to_file(main_menu_scene)


func _on_back_button_pressed() -> void:
	pause_menu_ui.visible = true
	settings_menu_ui.visible = false
