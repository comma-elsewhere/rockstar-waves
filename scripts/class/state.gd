@abstract
class_name State extends Node

@export var parent: Character
@export var animation_name: String = "idle"

func enter() -> void:
	#parent.animation.play(animation_name)
	print(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null
