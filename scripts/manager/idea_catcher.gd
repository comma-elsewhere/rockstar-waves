extends Node2D

signal catch_game_ended(idea_caught: bool)

@export var target: Area2D
@export var goal: Area2D
@export var path_follower: PathFollow2D
@export var timer: Timer
@export var win_particles: CPUParticles2D
@export var progress: ProgressBar

const DECAY_WAIT_TIME: float = 1.5
const SPEED_DECAY_TIME: float = 0.8
const SPEED_DECAY_RATE: float = 0.01
const MAX_DECAY: int = 20

var can_catch: bool = false
var decay_count: int = 0

func _ready() -> void:
	timer.start(DECAY_WAIT_TIME)
	timer.timeout.connect(_speed_decay)
	goal.area_entered.connect(_enable_catch.bind(true))
	goal.area_exited.connect(_enable_catch.bind(false))
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_catch:
		_end_minigame(true)
		win_particles.emitting = true
		
func _end_minigame(caught: bool) -> void:
	if caught:
		GFunc.play_sound(self, "GainInspo")
	else:
		GFunc.play_sound(self, "Fail")
	target.call_deferred("queue_free")
	timer.stop()
	if !win_particles.emitting:
		catch_game_ended.emit(caught)
	
func _enable_catch(area: Area2D, in_area: bool) -> void:
	if area == target:
		can_catch = in_area
	
func _speed_decay() -> void:
	decay_count += 1
	progress.value -= 1
	if decay_count > MAX_DECAY and target:
		_end_minigame(false)
	else:
		path_follower.set_speed(SPEED_DECAY_RATE)
		timer.start(SPEED_DECAY_TIME)
