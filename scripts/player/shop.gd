extends State

@export var camera: Camera3D
@export var idle: State

var shop_hud = Preload.HUD.Shop
var minigame_over: bool = false

func enter() -> void:
	minigame_over = false
	GInit.minigame_open = true
	var new_hud = shop_hud.instantiate()
	#new_hud.game_over.connect(gameover)
	camera.add_child(new_hud)
	GInit.mouse_free = true
	
func exit() -> void:
	GInit.minigame_open = false
	GInit.mouse_free = false
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

func gameover():
	minigame_over = true
