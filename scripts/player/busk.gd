extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var idle: State

var perform_hud := preload("res://scenes/minigames/perform_hud.tscn")

var minigame_over: bool = false

func enter() -> void:
	camera_control.over_shoulder()
	var new_hud = perform_hud.instantiate()
	new_hud.startup()
	new_hud.game_over.connect(_gameover)
	camera.add_child(new_hud)
	
func exit() -> void:
	camera_control.reset_camera()
	camera.get_child(2).queue_free()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("backout"):
		return idle
	return null
	
func process_frame(_delta: float) -> State:
	if minigame_over:
		return idle
	else:
		return null

func _gameover():
	minigame_over = true
