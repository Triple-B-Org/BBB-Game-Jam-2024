extends Button

@export var main_menu: PackedScene

func _on_pressed() -> void:
	var _result: Error = get_tree().change_scene_to_packed(main_menu)
