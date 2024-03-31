extends Label


func update_turns() -> void:
	text = "Turns: " + str(GlobalVar.player_actions) + "/" + str(GlobalVar.player_max_actions)


func reset_turns() -> void:
	text = "Turns: " + str(GlobalVar.player_max_actions) + "/" + str(GlobalVar.player_max_actions)
