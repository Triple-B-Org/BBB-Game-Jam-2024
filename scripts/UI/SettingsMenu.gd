extends Control


signal close_settings


func _on_check_button_toggled(toggled_on: bool) -> void:
	Settings.smooth_movement = toggled_on


func _on_back_button_pressed() -> void:
	var _result: Error = emit_signal("close_settings")
