extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var idle: State

var daw_hud := Preload.HUD.Song
var gameover := false

func enter() -> void:
	GInit.minigame_open = true
	var new_hud = daw_hud.instantiate()
	new_hud.game_over.connect(_game_over)
	camera.add_child(new_hud)
	
func exit() -> void:
	GInit.minigame_open = false
	GInit.mouse_free = false
	gameover = false
	camera_control.reset_camera()
	camera.get_child(2).queue_free()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("backout"):
		return idle
	return null

func process_frame(_delta: float) -> State:
	if gameover:
		return idle
	return null
	
func process_physics(_delta: float) -> State:
	return null

func _game_over() -> void:
	gameover = true
