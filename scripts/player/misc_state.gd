extends State

signal talking(words: String)

@export var camera: Camera3D
@export var idle: State

var idea_hud := Preload.HUD.Inspire
var minigame_over: bool = false

func enter() -> void:
	minigame_over = false
	GInit.minigame_open = true
	var new_hud = idea_hud.instantiate()
	new_hud.set_inspo(parent.hold_inspo)
	new_hud.game_over.connect(gameover)
	camera.add_child(new_hud)
	
func exit() -> void:
	GInit.minigame_open = false
	GInit.mouse_free = false
	camera.get_child(2).queue_free()
	talking.emit("I have some new ideas...")

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
