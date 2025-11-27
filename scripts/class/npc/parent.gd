extends NPC_Class

@export_enum("Mom", "Dad") var parent = 0
@export var tutorial_text: Array[String] = [""]

@onready var talking_timer: Timer = $TalkingTimer
@onready var inspo_cooldown: Timer = $InspoCooldown

signal talking(words: String)
signal inspiration(amount: int)

const MOVE_AWAY := 2.0
const SPEECH_DIST := 3.0
const TALK_INSPO := 1
const INSPO_COOLDOWN := 10.0

var tutorial: int = 0


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and global_position.distance_to(player.global_position) <= SPEECH_DIST:
		if !GInit.minigame_open and GInit.tutorial_tasks[parent] == 0:
			_tutorial_emit()
		elif !GInit.minigame_open:
			talking.emit(dialogue.hello())

func _tutorial_emit() -> void:
	var parent_name: String
	if parent == 0:
		parent_name = "Mom: \n"
	else:
		parent_name = "Dad: \n"
		
	talking.emit(parent_name + tutorial_text[tutorial])
	tutorial += 1
	
	if tutorial >= tutorial_text.size():
		GInit.tutorial_tasks[parent] += 1
		GInit.tutorial = GFunc.finish_tutorial()

func _move_away(direction: Vector3) -> void:
	talking.emit(dialogue.bump())
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
	talking_timer.start(randf_range(20.0, 30.0))
	if global_position.distance_to(player.global_position) <= SPEECH_DIST:
		talking.emit(dialogue.passing())
