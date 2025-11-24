extends Node

const SHOWTIME := 18

func _on_world_clock_hour_changed(new_hour: int) -> void:
	for child in get_children():
		if child.has_method("performance_control"):
			child.performance_control(new_hour >= SHOWTIME)
