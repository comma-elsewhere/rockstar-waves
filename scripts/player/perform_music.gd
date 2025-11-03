extends State

@export var camera: CamControl
@export var idle: State

func enter() -> void:
	camera.over_shoulder()
	
func exit() -> void:
	camera.reset_camera()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("interact"):
		return idle
	return null
