@abstract
class_name NPC_Class extends RigidBody3D

@export var dialogue: BasicDialogue
@export var area: Area3D

@onready var player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	area.body_entered.connect(_on_body_entered)
	area.body_exited.connect(_on_body_exited)
	
@abstract func _on_body_entered(body: Node3D) -> void


@abstract func _on_body_exited(body: Node3D) -> void
