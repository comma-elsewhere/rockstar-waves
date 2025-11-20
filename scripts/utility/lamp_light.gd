extends OmniLight3D

func _process(_delta: float) -> void:
	if GInit.world_time[1] >= 18 or GInit.world_time[1] <= 3:
		visible = true
	else:
		visible = false
