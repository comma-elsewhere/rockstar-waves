extends State

@export var camera_control: CamControl
@export var player_hud: Control
@export var idle: State

func enter() -> void:
	camera_control.over_shoulder()
	player_hud.show_reticle(true)
	
func exit() -> void:
	camera_control.reset_camera()
	player_hud.show_reticle(false)

func process_input(event: InputEvent) -> State:
	camera_control.rotate_camera(event)
	
	if event.is_action_pressed("backout"):
		return idle
	return null

func process_frame(_delta: float) -> State:
	camera_control.object_pickup()
	
	return null
