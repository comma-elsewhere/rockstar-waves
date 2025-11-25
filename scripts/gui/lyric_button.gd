extends Button

signal select_new_lyric(dict: Dictionary, toggle: bool)

var lyric_dict: Dictionary


func set_lyric() -> void:
	if !GInit.active_lyrics.is_empty():
		lyric_dict = GInit.active_lyrics.pick_random()
		
	print(lyric_dict)
		
	if lyric_dict:
		for key in lyric_dict.keys():
			text = key
	else:
		text = ". . ."

func _on_toggled(toggled_on: bool) -> void:
	select_new_lyric.emit(lyric_dict, toggled_on)
	GFunc.play_sound(self, "PencilSound")
