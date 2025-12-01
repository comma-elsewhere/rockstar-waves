extends State

@export var camera: CamControl
@export_subgroup("States")
@export var walk: State
@export var fall: State
@export var idle: State

func enter() -> void:
	parent.animation.set("parameters/Sprint/blend_position", -1.0)
	parent.animation.set("parameters/MoveState/blend_amount", move_toward(0, 1.0, 1.0))

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	
	if event.is_action_pressed("interact"):
		pass
	
#State Machine
	if event.is_action_pressed("sprint"):
		parent.animation.set("parameters/Walk/blend_position", -1.0)
		parent.animation.set("parameters/MoveState/blend_amount", move_toward(1.0, 0, 1.0))
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
