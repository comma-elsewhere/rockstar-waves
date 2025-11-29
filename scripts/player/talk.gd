extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var player_hud: Control
@export var raycast: RayCast3D
@export var idle: State
@export var perform: State
@export var shop: State

var talk_hud = Preload.HUD.Talk
var transfer = null

func enter() -> void:
	GInit.minigame_open = true
	camera_control.over_shoulder()
	var new_hud = talk_hud.instantiate()
	new_hud.state_changed.connect(transfer_state)
	new_hud.res = fetch_raycast()
	new_hud.call_deferred("setup")
	camera.add_child(new_hud)
	GInit.mouse_free = true
	
func exit() -> void:
	GInit.minigame_open = false
	camera_control.reset_camera()
	GInit.mouse_free = false
	camera.get_child(3).queue_free()
	transfer = null
	parent.exited_game.emit()

func process_input(event: InputEvent) -> State:
	if event.is_action_pressed("backout"):
		return idle
	return null

func process_frame(_delta: float) -> State:
	if transfer == "Perform":
		return perform
	if transfer == "Shop":
		return shop
	if transfer == "Idle":
		return idle
		
	return null

func process_physics(_delta: float) -> State:
	return null

func transfer_state(new_state: String) -> void:
	transfer = new_state

func fetch_raycast() -> ComplexDialogue:
	if raycast.is_colliding():
		if raycast.get_collider().has_method("return_resource"):
			var resource = raycast.get_collider().return_resource()
			return resource
		else:
			return null
	else:
		return null
