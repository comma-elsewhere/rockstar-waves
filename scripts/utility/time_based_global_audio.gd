extends AudioStreamPlayer

@export_group("Sounds")
@export var morning_sound: AudioStream
@export var evening_sound: AudioStream
@export var night_sound: AudioStream
@export_group("Times")
@export var morning: int = 4
@export var evening: int = 17
@export var night: int = 21

var sound_times: Array[int]

func _ready() -> void:
	sound_times = [night, evening, morning]
	_change_sound()

func _change_sound() -> void:
	for i in len(sound_times):
		if GInit.world_time[1] >= sound_times[i]:
			match i:
				0: stream = night_sound
				1: stream = evening_sound
				2: stream = morning_sound
		else:
			stream = night_sound
	play()


func _on_finished() -> void:
	_change_sound()
