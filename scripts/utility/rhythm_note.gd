extends Area2D

@export var sprite: Sprite2D
@export var label: Label
@export var animation: AnimationPlayer

const LEFT_SPAWN := Vector2(-80.0, -400.0)
const RIGHT_SPAWN := Vector2(80.0, -400.0)
const UP_SPAWN := Vector2(0.0, -400.0)

const OKAY = "OK"
const GOOD = "GOOD"
const PERFECT = "PERFECT!"
const MISS = "OOF"

var speed: int = 100

func _physics_process(delta: float) -> void:
	global_position.y += speed * delta

func _start(lane: int, bpm: int):
	speed = bpm * 4
	if lane == 1:
		global_position = LEFT_SPAWN
		sprite.rotation_degrees = 180.0
	elif lane == 2:
		global_position = UP_SPAWN
		sprite.rotation_degrees = -90.0
	else:
		global_position = RIGHT_SPAWN
		
func destroy(score: int):
	if score == 1:
		label.text = OKAY
	elif score == 2:
		label.text = GOOD
	elif score == 3:
		label.text = PERFECT
	else:
		label.text = MISS
	animation.play("destroy")
