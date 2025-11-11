@abstract
class_name Character extends CharacterBody3D

@onready var state_machine = $StateMachine
@export var animation: AnimationPlayer

const GRAVITY: float = -14

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init()
	self.add_to_group("Character")

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
