extends Area3D

@export_enum("WriteSong", "MakeMerch", "SellMerch", "Perform") var game_name: String

func _ready() -> void:
	add_to_group("Minigame")
