extends State

@export var camera: CamControl
@export_subgroup("States")
@export var walk: State
@export var fall: State
@export var idle: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	
#State Machine
	if event.is_action_pressed("sprint"):
		return walk
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	var input_dir := Input.get_vector("move_left", "move_right", "move_front", "move_back")
	var direction = (parent.transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * parent.run_speed 
		parent.velocity.z = direction.z * parent.run_speed 
	else:
		return idle
	parent.move_and_slide()

#State Machine
	if !parent.is_on_floor():
		return fall
	return null
