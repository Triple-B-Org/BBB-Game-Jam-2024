extends Node3D

var t: float = 2*PI


func _process(delta: float) -> void:
	if t != 2*PI:
		t = clamp(0.3 + t, 0, 2*PI)
		position.z = (cos(t) - 3) / 2

func go() -> void:
	print("hit")
	t = 0
