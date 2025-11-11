extends State

@export var camera: CamControl

@export_subgroup("Movement")
@export var walk: State
@export var run: State
@export var jump: State
@export var fall: State

@export_subgroup("Minigames")
@export var workspace: State
@export var sell_merch: State
@export var perform: State
@export var busk: State
@export var advertise: State

@export_subgroup("Other")
@export var talk: State

enum Minigames {NONE, WORK, SELL, PERFORM, BUSK, ADVERTISE}
var current_minigame

func _ready() -> void:
	current_minigame = Minigames.NONE
	parent.entered_game.connect(_change_minigame)
	camera.look_trigger.connect(_change_minigame)
	parent.exited_game.connect(_revert_minigame)
	#camera.look_untrigger.connect(_revert_minigame)

func _revert_minigame() -> void:
	current_minigame = Minigames.NONE

func _change_minigame(game_name: String) -> void:
	match game_name:
		"Workspace":
			current_minigame = Minigames.WORK
		"SellMerch":
			current_minigame = Minigames.SELL
		"Perform":
			current_minigame = Minigames.PERFORM
		"Busk":
			current_minigame = Minigames.BUSK
		"Advertise":
			current_minigame = Minigames.ADVERTISE

func process_input(event: InputEvent) -> State:
	camera.rotate_camera(event)

#State Machine
	if event.is_action_pressed("jump"):
		return jump
	elif event.is_action_pressed("movement") and event.is_action_pressed("sprint", true):
		return run
	elif event.is_action_pressed("movement"):
		return walk
	elif event.is_action_pressed("interact") and current_minigame == Minigames.WORK:
		return workspace
	elif event.is_action_pressed("interact") and current_minigame == Minigames.SELL:
		return sell_merch
	elif event.is_action_pressed("interact") and current_minigame == Minigames.PERFORM:
		return perform
	elif event.is_action_pressed("interact") and current_minigame == Minigames.BUSK:
		return busk 
	elif event.is_action_pressed("interact") and current_minigame == Minigames.ADVERTISE:
		return advertise
	return null


func process_physics(delta: float) -> State:
	process_movement(delta)

#State Machine
	if !parent.is_on_floor():
		return fall
	return null
		
func process_movement(delta: float) -> void:
	parent.velocity.x = lerp(parent.velocity.x, 0.0, delta * 20.0)
	parent.velocity.z = lerp(parent.velocity.z, 0.0, delta * 20.0)
	parent.move_and_slide()
