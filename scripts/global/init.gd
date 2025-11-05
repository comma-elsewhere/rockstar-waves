extends Node

#bool for if mouse is captured or visible
var mouse_free: bool = false

#initiate and access storage for player-made songs
var songbook: Array[Dictionary] = []

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		mouse_free = !mouse_free
		if mouse_free:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
