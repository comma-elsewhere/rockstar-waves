extends Area3D

@export var scene_path: String

var can_exit: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and can_exit:
		get_tree().change_scene_to_file(scene_path)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		can_exit = true

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		can_exit = false
