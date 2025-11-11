extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var idle: State

var daw_hud := Preload.HUD.Song

func enter() -> void:
	var new_hud = daw_hud.instantiate()
	camera.add_child(new_hud)
	
func exit() -> void:
	GInit.mouse_free = false
	camera_control.reset_camera()
	camera.get_child(2).queue_free()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("backout"):
		return idle
	return null
