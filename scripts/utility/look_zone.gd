extends Area3D

@onready var collision: CollisionShape3D = $CollisionShape3D

@export_enum("Workspace", "SellMerch","Advertise", "DAW") var game_name: String
