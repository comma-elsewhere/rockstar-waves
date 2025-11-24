extends AnimationPlayer

var past_minute: int = -1

func _process(_delta: float) -> void:
	if past_minute != GInit.world_time[2]:
		past_minute = GInit.world_time[2]
		advance(2.4/60.0/60.0)
