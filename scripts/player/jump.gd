extends State

@onready var can_jump_check: ShapeCast3D = $CanJumpCheck

@export var camera: Node3D
@export_subgroup("States")
@export var fall: State
@export var idle: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)
	return null

func process_physics(_delta: float) -> State:
	if !can_jump_check.is_colliding() and parent.is_on_floor():
		print("JUMP")
		parent.velocity.y += parent.jump_height
		parent.move_and_slide()
		
	elif parent.is_on_floor():
		return idle
	elif !parent.is_on_floor():
	#	await parent.animation.animation_finished
		return fall
	return
