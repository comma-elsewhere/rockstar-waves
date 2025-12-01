extends State

@export var can_jump_check: ShapeCast3D
@export var camera: CamControl
@export_subgroup("States")
@export var fall: State
@export var idle: State
@export var walk: State

func enter() -> void:
	parent.animation.set("parameters/OneShot/request", AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	return null

func process_frame(_delta: float) -> State:
	return null

func process_physics(_delta: float) -> State:
	if !can_jump_check.is_colliding() and parent.is_on_floor():
		parent.velocity.y += parent.jump_height
		parent.move_and_slide()
		
	elif Input.is_action_pressed("movement") and parent.is_on_floor():
		return walk
	elif parent.is_on_floor():
		return idle
	elif !parent.is_on_floor():
	#	await parent.animation.animation_finished
		return fall
	return
