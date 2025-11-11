class_name Conductor extends AudioStreamPlayer

@onready var manager = self.get_parent()

var start_timer: Timer

var bpm 
var measures 
var offset 

# Tracking the beat and song position
var song_position:float = 0.0
var song_position_in_beats:int = 1
var sec_per_beat:float = 60.0 
var last_reported_beat:int = 0
var beats_before_start:int = 0
var measure:int = 1
var song_length: float 

# Determining how close to the beat an event is
var closest := 0
var time_off_beat := 0.0

signal _on_beat(position:int)
signal _on_measure(position:int)


func _ready():
	bpm = manager.current_song.actual_bpm
	measures = manager.current_song.time_sig
	offset = manager.current_song.sec_offset
	stream = manager.current_song.audio_stream
	sec_per_beat /= bpm
	song_length = stream.get_length()
	start_timer = Timer.new()
	add_child(start_timer)
	start_timer.one_shot = true
	start_timer.timeout.connect(_on_StartTimer_timeout)

func _physics_process(_delta):
	if playing:
		song_position = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_position -= AudioServer.get_output_latency()
		song_position_in_beats = int(floor(song_position / sec_per_beat)) + beats_before_start
		_report_beat()


func _report_beat():
	if last_reported_beat < song_position_in_beats:
		if measure > measures:
			measure = 1
		_on_beat.emit(song_position_in_beats)
		_on_measure.emit(measure)
		last_reported_beat = song_position_in_beats
		measure += 1


func play_with_beat_offset(num):
	beats_before_start = num
	start_timer.wait_time = sec_per_beat
	start_timer.start()


func closest_beat(nth):
	closest = int(round((song_position / sec_per_beat) / nth) * nth) 
	time_off_beat = abs(closest * sec_per_beat - song_position)
	return Vector2(closest, time_off_beat)


func play_from_beat(beat, start_offset):
	play()
	seek(beat * sec_per_beat)
	beats_before_start = start_offset
	measure = beat % measures


func _on_StartTimer_timeout():
	song_position_in_beats += 1
	if song_position_in_beats < beats_before_start - 1:
		start_timer.start()
	elif song_position_in_beats == beats_before_start - 1:
		start_timer.wait_time = start_timer.wait_time - (AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency())
		start_timer.start()
	else:
		play(offset)
		start_timer.stop()
	_report_beat()
