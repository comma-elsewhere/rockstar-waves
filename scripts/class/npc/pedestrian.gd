extends NPC_Class

signal waypoint_reached(me: NPC_Class)
signal talking(words: String)

const MOVE_AWAY := 10.0
const SPEECH_DIST := 8.0
const SPEED := 11.0
const DODGE_TIME := 0.7

@export var navigation: NavigationAgent3D
@onready var timer: Timer = $DodgeTimer

var avoiding_body: Node3D = null

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and global_position.distance_to(player.global_position) <= SPEECH_DIST / 1.5:
		if !GInit.minigame_open:
			talking.emit(dialogue.hello())

func _physics_process(_delta: float) -> void:
	if avoiding_body != null:
		_avoid(avoiding_body)
		if global_position.distance_to(player.global_position) <= SPEECH_DIST:
			talking.emit(dialogue.passing())
	elif navigation.target_position and timer.is_stopped():
		var dir: Vector3 = global_position.direction_to(navigation.get_next_path_position())
		call_deferred("apply_central_force", dir * SPEED)
		
func nav_to_waypoint(new_waypoint: Node3D) -> void:
	navigation.target_position = new_waypoint.global_position

func _dodge() -> void:
	var dir := -global_position.direction_to(player.global_position)
	apply_impulse(dir * MOVE_AWAY)
	timer.start(DODGE_TIME)
	
func _avoid(body: Node3D) -> void:
	var direction := -global_position.direction_to(body.global_position)
	apply_force(direction * MOVE_AWAY)
	if linear_velocity == Vector3.ZERO:
		waypoint_reached.emit(self)
		
func _on_body_entered(body: Node3D) -> void:
	if body == player:
		talking.emit(dialogue.bump())
		_dodge()
	elif body.is_in_group("Pedestrians") and body != self:
		avoiding_body = body
		
		
func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Pedestrians"):
		avoiding_body = null

func _on_navigation_agent_3d_navigation_finished() -> void:
	waypoint_reached.emit(self)
	linear_velocity = lerp(linear_velocity, Vector3.ZERO, 1.0)
