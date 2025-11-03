extends State

@export var camera: CamControl
@export_subgroup("States")
@export var walk: State
@export var fall: State
@export var idle: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	
#State Machine
	if event.is_action_released("movement"):
		return idle
	elif event.is_action_pressed("sprint"):
		return walk
	return null

func process_physics(_delta: float) -> State:
	process_movement()
	
#State Machine
	if !parent.is_on_floor():
		return fall
	return null

func process_movement() -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_front", "move_back")
	var direction = (camera.transform.basis * Vector3(input_dir.x, 0.0, input_dir.y)).normalized()
	parent.velocity.x = direction.x * parent.run_speed 
	parent.velocity.z = direction.z * parent.run_speed 
	parent.move_and_slide()
