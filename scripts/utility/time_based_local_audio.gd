extends AudioStreamPlayer3D

@export_range(0,24) var active_time: int
@export_range(0,24) var inactive_time: int

@onready var timer: Timer = $Timer

func _ready() -> void:
	_change_sound()

func _change_sound() -> void:
	if GInit.world_time[1] >= active_time:
		if GInit.world_time[1] < inactive_time:
			play()
		else:
			timer.start()
	else:
		timer.start()

func _on_finished() -> void:
	_change_sound()


func _on_timer_timeout() -> void:
	_change_sound()
