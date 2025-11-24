extends Area3D

const DISABLED := 180.0

@onready var collision: CollisionShape3D = $CollisionShape3D

@export_enum("Perform", "Busk", "Workspace", "Bedtime") var game_name: String
@export_range(0,5) var zone_quality: int = 0


func performance_control(can_perform: bool) -> void:
	if game_name == "Perform":
		visible = can_perform
		collision.disabled = !can_perform

func disable_minute() -> void:
	if game_name == "Busk":
		visible = false
		collision.disabled = true
		await get_tree().create_timer(DISABLED).timeout
		visible = true
		collision.disabled = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.zone_quality = zone_quality

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body.zone_quality = 0
