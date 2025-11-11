extends State

@export var camera_control: CamControl
@export var camera: Camera3D
@export var reticle: ColorRect
@export var idle: State
@export var daw_hud: State

var looking_at_daw: bool = false

func _ready() -> void:
	camera_control.look_trigger.connect(_set_looking)
	camera_control.look_untrigger.connect(_unset_looking)
	
func _set_looking(game_name: String):
	if game_name == "DAW":
		looking_at_daw = true
		
func _unset_looking():
	looking_at_daw = false

func enter() -> void:
	camera_control.over_shoulder()
	reticle.visible = true
	
func exit() -> void:
	camera_control.reset_camera()
	reticle.visible = false

func process_input(event: InputEvent) -> State:
	camera_control.rotate_camera(event)
	
	if event.is_action_pressed("interact") and looking_at_daw:
		return daw_hud
	
	if event.is_action_pressed("backout"):
		return idle
	return null
