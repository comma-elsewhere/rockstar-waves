extends Node2D

@export_enum("Right", "Left", "Up") var arrow_direction: String = "Right"
@export var sprite: AnimatedSprite2D
@export var particles: CPUParticles2D
@export var okay_zone: Area2D
@export var good_zone: Area2D
@export var perfect_zone: Area2D

const RIGHT_POS := Vector2(80,320)
const LEFT_POS := Vector2(-80,320)
const UP_POS := Vector2(0, 320)

enum Score {NONE = 0, OKAY = 1, GOOD = 2, PERFECT = 3}

var current_note = null
var note_score: int
var input: String = ""
var expected_input: String

func _ready() -> void:
	note_score = Score.NONE
	
	okay_zone.area_entered.connect(_new_note)
	okay_zone.area_entered.connect(_change_score.bind(Score.OKAY))
	good_zone.area_entered.connect(_change_score.bind(Score.GOOD))
	perfect_zone.area_entered.connect(_change_score.bind(Score.PERFECT))
	perfect_zone.area_exited.connect(_change_score.bind(Score.GOOD))
	good_zone.area_exited.connect(_change_score.bind(Score.OKAY))
	okay_zone.area_exited.connect(_change_score.bind(Score.NONE))
	okay_zone.area_exited.connect(_note_missed)
	
	if arrow_direction == "Left":
		expected_input = "rhythm_left"
		sprite.rotation_degrees = 180.0
		global_position = LEFT_POS
	elif arrow_direction == "Up":
		expected_input = "rhythm_up"
		sprite.rotation_degrees = -90.0
		global_position = UP_POS
	else:
		expected_input = "rhythm_right"
		global_position = RIGHT_POS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(expected_input):
		sprite.frame = 1
		if note_score != Score.NONE and current_note:
			current_note.destroy(note_score)
			current_note = null
			get_parent().increment_score(note_score)
			particles.emitting = true
	if event.is_action_released(expected_input):
		sprite.frame = 0

func _new_note(body: Node2D):
	if body.is_in_group("RhythmNote"):
		current_note = body

func _note_missed(body: Node2D):
	if body == current_note:
		body.destroy(note_score)
		get_parent().reset_combo()

func _change_score(body: Node2D, new_score: Score):
	if body == current_note:
		note_score = new_score
