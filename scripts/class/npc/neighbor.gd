extends NPC_Class

signal talking(words: String)
signal inspiration(amount: int)

const MOVE_AWAY := 5.0
const SPEECH_DIST := 7.0
const TALK_INSPO := 2
const SHOVE_INSPO := 1
const INSPO_COOLDOWN := 5.0

@onready var talking_timer: Timer = $TalkingTimer
@onready var inspo_cooldown: Timer = $InspoCooldown

@export var animation: AnimationTree

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and global_position.distance_to(player.global_position) <= SPEECH_DIST / 1.5:
		if !GInit.minigame_open:
			talking.emit(dialogue.hello())
			_get_inspired(TALK_INSPO)

func _move_away(direction: Vector3) -> void:
	talking.emit(dialogue.bump())
	_get_inspired(SHOVE_INSPO)
	animation.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	apply_impulse(direction * MOVE_AWAY)
	
func _get_inspired(amount: int):
	if inspo_cooldown.is_stopped():
		inspiration.emit(amount)
		GStat.inspo_points += amount
		GFunc.play_sound(self.get_parent(), "GainInspo")
	inspo_cooldown.start(INSPO_COOLDOWN)

func _on_body_entered(body: Node3D) -> void:
	if body == player:
		var dir = global_position.direction_to(player.global_position)
		_move_away(-dir)
		
func _on_body_exited(body: Node3D) -> void:
	if body == player:
		linear_velocity = lerp(linear_velocity, Vector3.ZERO, 1.0)
		

func _on_talking_timer_timeout() -> void:
	talking_timer.start(randf_range(15.0, 30.0))
	if global_position.distance_to(player.global_position) <= SPEECH_DIST:
		talking.emit(dialogue.passing())
	
