extends Control


signal close_settings


@onready var fullscreen_button: Button = $Fullscreen/FullscreenButton
@onready var resolution_option: OptionButton = $Resolution/OptionButton
@onready var smooth_movement_button: Button = $SmoothTransition/CheckButton
@onready var smooth_value_bar: HSlider = $SmoothTransition/HSlider
@onready var smooth_value_label: Label = $SmoothTransition/SmoothValueLabel


var resolution_lookup: Array[Vector2i] = [Vector2i(2560, 1440), Vector2i(1920, 1080), Vector2i(1440, 1080), Vector2i(1280, 1080), Vector2i(1280, 720)]


func set_options() -> void:
	Settings.fullscreen = false
	fullscreen_button.button_pressed = Settings.fullscreen
	_on_fullscreen_button_toggled(false)
	resolution_option.selected = Settings.resolution_index
	smooth_movement_button.button_pressed = Settings.smooth_movement
	smooth_value_bar.value = Settings.move_speed


func _on_check_button_toggled(toggled_on: bool) -> void:
	Settings.smooth_movement = toggled_on


func _on_back_button_pressed() -> void:
	var _result: Error = emit_signal("close_settings")


func _on_h_slider_value_changed(value: float) -> void:
	Settings.move_speed = value
	smooth_value_label.text = str(value * 10)


func _on_option_button_item_selected(index: int) -> void:
	get_window().size = resolution_lookup[index]
	get_window().content_scale_size = resolution_lookup[index]
	Settings.resolution_index = index
	Settings.fullscreen = false
	fullscreen_button.button_pressed = Settings.fullscreen
	_on_fullscreen_button_toggled(false)


func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	Settings.fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	get_window().size = resolution_lookup[Settings.resolution_index]
	get_window().content_scale_size = resolution_lookup[Settings.resolution_index]

