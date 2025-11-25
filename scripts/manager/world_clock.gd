extends AnimationPlayer

func _ready() -> void:
	var minutes_passed: float = ((GInit.world_time[1] * 60.0) + GInit.world_time[2])
	var advance_by: float = minutes_passed / 60.0 / 10.0
	call_deferred("advance", advance_by)
	print(advance_by)
	Clock.minute_changed.connect(_on_minute_changed)

func _on_minute_changed():
	var minute_conversion: float = 1.0 / 60.0 / 10.0
	advance(minute_conversion)
