extends State

@export var camera: Node3D
@export_subgroup("States")
@export var idle: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	return null

#fall with momentum
func process_physics(delta: float) -> State:
	parent.velocity.x = lerp(parent.velocity.x, 0.0, delta * 3.0)
	parent.velocity.z = lerp(parent.velocity.z, 0.0, delta * 3.0)
	parent.velocity.y += parent.GRAVITY * delta
	parent.move_and_slide()

#State Machine
	if parent.is_on_floor():
		return idle
	return null
