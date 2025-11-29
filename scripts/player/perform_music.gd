extends State

signal talking(words: String)

@export var camera_control: CamControl
@export var camera: Camera3D
@export var idle: State

const RIVALS := "BOUNCER:\nSorry, kid. The Rivals are playing here tonight..."

var perform_hud = Preload.HUD.Perform

var minigame_over: bool = false

func enter() -> void:
	if GFunc.venue_quality(parent.zone_quality):
		GInit.minigame_open = true
		camera_control.over_shoulder()
		var new_hud = perform_hud.instantiate()
		new_hud.startup()
		new_hud.game_over.connect(_gameover)
		camera.add_child(new_hud)
	else:
		minigame_over = true
		talking.emit(RIVALS)
	
func exit() -> void:
	GInit.minigame_open = false
	GInit.mouse_free = false
	camera_control.reset_camera()
	camera.get_child(3).queue_free()
	parent.exited_game.emit()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("backout"):
		return idle
	return null
	
func process_frame(_delta: float) -> State:
	if minigame_over:
		return idle
	else:
		return null
	
func process_physics(_delta: float) -> State:
	return null

func _gameover():
	minigame_over = true
