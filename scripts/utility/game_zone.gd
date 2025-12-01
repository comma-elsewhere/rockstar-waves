extends Area3D

const DISABLED := 200.0

@onready var collision: CollisionShape3D = $CollisionShape3D

@export_enum("SellMerch", "Busk", "Workspace", "Bedtime") var game_name: String
@export_range(0.1,1,0.1) var zone_quality: float = 0

func disable_minute() -> void:
	if game_name == "Busk":
		$MeshInstance3D.visible = false
		collision.disabled = true
		await get_tree().create_timer(DISABLED).timeout
		$MeshInstance3D.visible = true
		collision.disabled = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.zone_quality = zone_quality

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.zone_quality = 0
