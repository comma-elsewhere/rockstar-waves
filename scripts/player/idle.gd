extends State

@export var camera: Node3D

@export_subgroup("Movement")
@export var walk: State
@export var run: State
@export var jump: State
@export var fall: State

@export_subgroup("Minigames")
@export var write_song: State
@export var make_merch: State
@export var sell_merch: State
@export var perform: State

@export_subgroup("Other")
@export var talk: State

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)

	if event.is_action_pressed("jump"):
		return jump
	elif event.is_action_pressed("movement") and event.is_action_pressed("sprint", true):
		return run
	elif event.is_action_pressed("movement"):
		return walk
	return null

func process_physics(delta: float) -> State:
	parent.velocity.x = lerp(parent.velocity.x, 0.0, delta * 8.0)
	parent.velocity.z = lerp(parent.velocity.z, 0.0, delta * 8.0)
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall
	return null
		
