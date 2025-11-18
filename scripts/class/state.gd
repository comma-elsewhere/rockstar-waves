@abstract
class_name State extends Node

@export var parent: Character
@export var animation_name: String = "idle"

func enter() -> void:
	#parent.animation.play(animation_name)
	pass

func exit() -> void:
	pass

@abstract func process_input(event: InputEvent) -> State

@abstract func process_frame(delta: float) -> State

@abstract func process_physics(delta: float) -> State
