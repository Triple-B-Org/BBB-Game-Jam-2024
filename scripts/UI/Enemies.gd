extends Label


func _process(_delta: float) -> void:
	visible = !GlobalVar.boss_room
	$"../ProgressBar".visible = GlobalVar.boss_room
	$"../Label".visible = GlobalVar.boss_room


func enemies_left() -> void:
	text = "There are enemies nearby!"


func no_enemies_left() -> void:
	text = "The portal has opened!"
