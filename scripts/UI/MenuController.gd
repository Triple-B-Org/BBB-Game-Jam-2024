extends Control

@export var start_game_scene: String

@export var main_menu_ui: Control
@export var settings_menu_ui: Control
@export var credits_menu_ui: Control

@onready var audioplayer = $AudioStreamPlayer

func _ready():
	audioplayer.play()
	pass

func _on_start_button_pressed() -> void:
	audioplayer.stop()
	var _result: Error = get_tree().change_scene_to_file(start_game_scene)


func _on_settings_button_pressed() -> void:
	main_menu_ui.visible = false
	settings_menu_ui.visible = true
	settings_menu_ui.set_options()


func _on_quit_button_pressed() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)


func _on_back_button_pressed() -> void:
	main_menu_ui.visible = true
	settings_menu_ui.visible = false
	credits_menu_ui.visible = false


func _on_credits_button_pressed() -> void:
	main_menu_ui.visible = false
	credits_menu_ui.visible = true
