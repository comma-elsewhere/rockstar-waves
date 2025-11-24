extends Node3D

@export var inspiration_amount: int = 8

@onready var particles: GPUParticles3D = $GPUParticles3D
@onready var area: Area3D = $Area3D
@onready var collision: CollisionShape3D = $Area3D/CollisionShape3D

const DISABLE_TIME := 270.0

func disable_minute():
	particles.visible = false
	collision.disabled = true
	await get_tree().create_timer(DISABLE_TIME).timeout
	particles.visible = true
	collision.disabled = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.store_area = self
		body.entered_game.emit("Inspire")
		body.hold_inspo = inspiration_amount

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.store_area = null
		body.exited_game.emit()
		body.hold_inspo = 0
