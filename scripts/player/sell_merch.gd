extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var player_hud: Control
@export var idle: State

var news_hud = Preload.HUD.News

func enter() -> void:
	GInit.minigame_open = true
	camera_control.over_shoulder()
	var hud = news_hud.instantiate()
	camera.add_child(hud)
	#player_hud.show_reticle(true)
	
func exit() -> void:
	GInit.minigame_open = false
	camera.get_child(3).queue_free()
	parent.exited_game.emit()
	camera_control.reset_camera()
	#player_hud.show_reticle(false)

func process_input(event: InputEvent) -> State:
	#camera_control.rotate_camera(event)
	
	if event.is_action_pressed("backout"):
		return idle
	return null

func process_frame(_delta: float) -> State:
	#camera_control.object_pickup()
	
	return null

func process_physics(_delta: float) -> State:
	return null
