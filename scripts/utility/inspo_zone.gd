extends Node3D

@export var inspiration_amount: int = 5

@onready var particles: GPUParticles3D = $GPUParticles3D
@onready var area: Area3D = $Area3D
@onready var collision: CollisionShape3D = $Area3D/CollisionShape3D

@onready var player = get_tree().get_first_node_in_group("Player")

const DISABLE_TIME := 270.0

func disable_minute():
	particles.visible = false
	collision.disabled = true
	await get_tree().create_timer(DISABLE_TIME).timeout
	particles.visible = true
	collision.disabled = false

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body == player:
		player.store_area = self
		player.entered_game.emit("Inspire")
		player.hold_inspo = inspiration_amount

func _on_area_3d_body_exited(body: Node3D) -> void:
	if body == player:
		player.store_area = null
		player.exited_game.emit()
		player.hold_inspo = 0
