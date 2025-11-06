class_name StageManager extends Node2D

@export var HUD: Control
@export var conductor_node: Conductor
@export var beat_offset: int = 0
@export var song_end: float = 0.0

const SCORE_FONT_SIZE := 64
const COMBO_FONT_SIZE := 32

var current_song: SongResource

var score = 0
var combo = 0

var song_finished: bool = false

var max_combo = 0
var great = 07
var good = 0
var okay = 0
var missed = 0

var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0

var spawn_1_beat = 1
var spawn_2_beat = 0
var spawn_3_beat = 0
var spawn_4_beat = 0

var lane = 0
var rand = 0
var note = preload("res://prefabs/components/rhythm_note.tscn")


func _ready():
	randomize()
	sec_per_beat /= conductor_node.bpm
	conductor_node.play_with_beat_offset(beat_offset)
	conductor_node._on_measure.connect(_on_Conductor_measure)
	conductor_node._on_beat.connect(_on_Conductor_beat)

func _on_Conductor_measure(music_position):
	if (song_position_in_beats * sec_per_beat) + (beat_offset * sec_per_beat) < conductor_node.song_length - song_end:
		if music_position == 1:
			_spawn_notes(spawn_1_beat)
		elif music_position == 2:
			_spawn_notes(spawn_2_beat)
		elif music_position == 3:
			_spawn_notes(spawn_3_beat)
		elif music_position == 4:
			_spawn_notes(spawn_4_beat)
	else:
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://RhythmGame/levels/select_song_menu.tscn")

func _on_Conductor_beat(music_position):
	song_position_in_beats = music_position
	if song_position_in_beats > 36:
		spawn_1_beat = 1
		spawn_2_beat = 1
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 98:
		spawn_1_beat = 2
		spawn_2_beat = 0
		spawn_3_beat = 1
		spawn_4_beat = 0
	if song_position_in_beats > 132:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 162:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 1
	if song_position_in_beats > 194:
		spawn_1_beat = 2
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 228:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 258:
		spawn_1_beat = 1
		spawn_2_beat = 2
		spawn_3_beat = 1
		spawn_4_beat = 2
	if song_position_in_beats > 288:
		spawn_1_beat = 0
		spawn_2_beat = 2
		spawn_3_beat = 0
		spawn_4_beat = 2
	if song_position_in_beats > 322:
		spawn_1_beat = 3
		spawn_2_beat = 2
		spawn_3_beat = 2
		spawn_4_beat = 1
	if song_position_in_beats > 388:
		spawn_1_beat = 1
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	if song_position_in_beats > 396:
		spawn_1_beat = 0
		spawn_2_beat = 0
		spawn_3_beat = 0
		spawn_4_beat = 0
	#if song_position_in_beats > 404:
		#Global.set_score(score)
		#Global.combo = max_combo
		#Global.great = great
		#Global.good = good
		#Global.okay = okay
		#Global.missed = missed



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
		combo += 1
	else:
		combo = 0
	
	if by == 3:
		great += 1
	elif by == 2:
		good += 1
	elif by == 1:
		okay += 1
	else:
		missed += 1
	
	
	score += by * combo
	score_label.text = str(score)
	if combo > 0:
		combo_label.text = str(combo) + " combo!"
		if combo > max_combo:
			max_combo = combo
	else:
		combo_label.text = ""


func reset_combo():
	combo = 0
	combo_label.text = ""
