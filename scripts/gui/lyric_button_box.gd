extends HBoxContainer

signal new_lyric_from_button(dict: Dictionary, toggle: bool)

@onready var lyric_button = preload("res://prefabs/components/gui/lyric_button.tscn")

const BUTTON_COUNT := 4

func _ready() -> void:
	randomize()
	for i in range(BUTTON_COUNT):
		var new_lyric = lyric_button.instantiate()
		new_lyric.set_lyric(randi_range(1,7))
		add_child(new_lyric)
	
	for child in get_children():
		child.select_new_lyric.connect(_on_lyric_selected)

func _on_lyric_selected(lyric_dict: Dictionary, button_toggled: bool) -> void:
	new_lyric_from_button.emit(lyric_dict, button_toggled)
