extends AudioStreamPlayer3D

@export_range(0,24) var active_time: int
@export_range(0,24) var inactive_time: int

@onready var timer: Timer = $Timer

func _ready() -> void:
	_change_sound()
	timer.start()
	
func _process(_delta: float) -> void:
	if GInit.minigame_open:
		stream_paused = true
	else:
		stream_paused = false

func _change_sound() -> void:
	if GInit.world_time[1] > inactive_time or GInit.world_time[1] <= active_time:
		stream_paused = true
	else:
		stream_paused = false

func _on_timer_timeout() -> void:
	_change_sound()
