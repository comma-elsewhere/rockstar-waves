extends VBoxContainer

@export var parent: Control

signal song_selected(song_dict: Dictionary)

func startup():
	if !GInit.songbook.is_empty():
		for i in range(GInit.songbook.size()):
			var new_button = SongButton.new()
			new_button.set_button_info(GInit.songbook[i])
			new_button.button_up.connect(_on_button_pressed.bind(new_button.song_dict))
			add_child(new_button)
		
func _on_button_pressed(select_dict: Dictionary):
	song_selected.emit(select_dict)
	GInit.mouse_free = false
	parent.visible = false
