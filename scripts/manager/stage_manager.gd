class_name StageManager extends Node2D

signal song_ended(score: int, combo: int, perfect: int, good: int, okay: int, missed: int)

@export var HUD: Control
@export var conductor_node: Conductor

@export var current_song: SongResource

var current_score: int = 0
var current_combo: int = 0

var song_finished: bool = false

var max_combo: int = 0
var great_count: int = 0
var good_count: int = 0
var okay_count: int = 0
var missed_count: int = 0

var song_position: float = 0
var song_position_in_beats: int = 0
var last_spawned_beat: int = 0
var sec_per_beat: float = 60.0

var song_intro_part: float
var song_first_mid: float
var song_bridge_mid: float
var song_second_mid: float
var song_end_part: float

var beat_spawner: Array[int] = [1,0,0,0,1,0,0,0]

var lane: int = 0
var rand: int = 0
var note := preload("res://prefabs/components/rhythm_note.tscn")


func _ready():
	randomize()
	conductor_node.play_with_beat_offset(current_song.beat_offset)
	conductor_node._on_measure.connect(_on_Conductor_measure)
	conductor_node._on_beat.connect(_on_Conductor_beat)
	_set_values()

func _set_values() -> void:
	sec_per_beat /= current_song.actual_bpm
	song_intro_part = sec_per_beat * current_song.intro
	song_first_mid = sec_per_beat * current_song.first_half
	song_bridge_mid = sec_per_beat * current_song.bridge
	song_second_mid = sec_per_beat * current_song.second_half
	song_end_part = sec_per_beat * current_song.ending

func _on_Conductor_measure(music_position):
	if (song_position_in_beats * sec_per_beat) + (current_song.beat_offset * sec_per_beat) < conductor_node.song_length - current_song.song_end:
		for i in range(current_song.time_sig):
			if i + 1 == music_position:
				_spawn_notes(beat_spawner[i])
	else:
		await get_tree().create_timer(current_song.song_end).timeout
		song_ended.emit(current_score, max_combo, great_count, good_count, okay_count, missed_count)

func _on_Conductor_beat(music_position):
	song_position_in_beats = music_position
	if song_position_in_beats > song_end_part:
		beat_spawner = [1,2,1,2,1,2,1,2]
	elif song_position_in_beats > song_second_mid:
		beat_spawner = [2,2,1,1,2,1,2,1]
	elif song_position_in_beats > song_bridge_mid:
		beat_spawner = [0,2,1,0,2,1,0,2]
	elif song_position_in_beats > song_first_mid:
		beat_spawner = [2,0,1,0,2,2,0,1]
	elif song_position_in_beats > song_intro_part:
		beat_spawner = [1,1,1,1,0,1,0,1]
	
		
func _spawn_notes(to_spawn):
	if to_spawn > 0:
		lane = randi() % 3
		var instance = note.instantiate()
		instance._start(lane, conductor_node.bpm)
		add_child(instance)
	if to_spawn > 1:
		while rand == lane:
			rand = randi() % 3
		lane = rand
		var instance = note.instantiate()
		instance._start(lane, conductor_node.bpm)
		add_child(instance)

func increment_score(by):
	if by > 0:
		current_combo += 1
	else:
		current_combo = 0
	
	if by == 3:
		great_count += 1
	elif by == 2:
		good_count += 1
	elif by == 1:
		okay_count += 1
	else:
		missed_count += 1
	
	current_score += by * current_combo
	
	if current_combo > max_combo:
		max_combo = current_combo
		
	HUD.update_score(current_score, current_combo)

func reset_combo():
	current_combo = 0
	missed_count += 1
	HUD.update_score(current_score, current_combo)

func set_song(new_song: SongResource):
	current_song = new_song
