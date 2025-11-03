extends State

@export var camera: CamControl
@export_subgroup("States")
@export var idle: State
@export var walk: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	return null

func process_physics(delta: float) -> State:
	process_movement(delta)

#State Machine
	if parent.is_on_floor() and Input.is_action_pressed("movement"):
		return walk
	elif parent.is_on_floor():
		return idle
	return null

#momentum + gravity
func process_movement(delta:float):
	parent.velocity.x = lerp(parent.velocity.x, 0.0, delta * 3.0)
	parent.velocity.z = lerp(parent.velocity.z, 0.0, delta * 3.0)
	parent.velocity.y += parent.GRAVITY * delta
	parent.move_and_slide()
