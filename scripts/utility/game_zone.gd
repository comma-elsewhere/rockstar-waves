extends Area3D

const DISABLED := 180.0

@onready var collision: CollisionShape3D = $CollisionShape3D

@export_enum("Workspace", "SellMerch", "Perform", "Busk", "Advertise", "DAW") var game_name: String

func disable_minute() -> void:
	if game_name == "Busk":
		visible = false
		collision.disabled = true
		await get_tree().create_timer(DISABLED).timeout
		visible = true
		collision.disabled = false
