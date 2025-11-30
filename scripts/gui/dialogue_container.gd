extends MarginContainer

const WAIT_TIME = 2.5

@onready var dialogue_label: Label = $PanelContainer/DialogueLabel

var characters: Array

func _ready() -> void:
	visible = false
	characters = get_tree().get_nodes_in_group("Character")
	for node in characters:
		node.talking.connect(on_talking)
		
func on_talking(words: String) -> void:
	if !visible:
		dialogue_label.text = words
		visible = true
		await get_tree().create_timer(WAIT_TIME).timeout
		visible = false
