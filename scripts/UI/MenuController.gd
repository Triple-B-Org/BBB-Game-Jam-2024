extends Control

@export var start_game_scene: PackedScene

@export var main_menu_ui: Control
@export var settings_menu_ui: Control

func _on_start_button_pressed() -> void:
	var _result: Error = get_tree().change_scene_to_packed(start_game_scene)


func _on_settings_button_pressed() -> void:
	main_menu_ui.visible = false
	settings_menu_ui.visible = true


func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_check_button_toggled(toggled_on: bool) -> void:
	Settings.smooth_movement = toggled_on


func _on_back_button_pressed():
	main_menu_ui.visible = true
	settings_menu_ui.visible = false
