extends Control


signal close_settings


@onready var fullscreen_button: Button = $Fullscreen/FullscreenButton
@onready var resolution_option: OptionButton = $Resolution/OptionButton
@onready var audio_value_label: Label = $Audio/AudioValueLabel
@onready var audio_value_bar: HSlider = $Audio/AudioHSlider
@onready var smooth_movement_button: Button = $SmoothTransition/CheckButton
@onready var smooth_value_bar: HSlider = $SmoothTransition/HSlider
@onready var smooth_value_label: Label = $SmoothTransition/SmoothValueLabel


var resolution_lookup: Array[Vector2i] = [Vector2i(2560, 1440), Vector2i(1920, 1080), Vector2i(1440, 1080), Vector2i(1280, 1080), Vector2i(1280, 720)]


func set_options() -> void:
	fullscreen_button.button_pressed = Settings.fullscreen
	resolution_option.selected = Settings.resolution_index
	audio_value_label.text = str(Settings.audio_volume * 100)
	audio_value_bar.value = Settings.audio_volume
	smooth_movement_button.button_pressed = Settings.smooth_movement
	smooth_value_label.text = str(Settings.move_speed * 10)
	smooth_value_bar.value = Settings.move_speed


func set_fullscreen(toggled_on: bool) -> void:
	Settings.fullscreen = toggled_on
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func set_resolution(index: int) -> void:
	get_window().size = resolution_lookup[index]
	get_window().content_scale_size = resolution_lookup[index]
	Settings.resolution_index = index


func _on_check_button_toggled(toggled_on: bool) -> void:
	Settings.smooth_movement = toggled_on


func _on_back_button_pressed() -> void:
	var _result: Error = emit_signal("close_settings")


func _on_h_slider_value_changed(value: float) -> void:
	Settings.move_speed = value
	smooth_value_label.text = str(value * 10)


func _on_option_button_item_selected(index: int) -> void:
	set_resolution(index)
	set_fullscreen(Settings.fullscreen)


func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	set_fullscreen(toggled_on)
	set_resolution(Settings.resolution_index)


func _on_audio_h_slider_value_changed(value: float) -> void:
	Settings.audio_volume = value
	audio_value_label.text = str(value * 100)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
