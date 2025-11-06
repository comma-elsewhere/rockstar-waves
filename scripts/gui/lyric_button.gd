extends Button

signal select_new_lyric(dict: Dictionary, toggle: bool)

var lyric_dict: Dictionary


func set_lyric() -> void:
	if !Lyric.activated.is_empty():
		lyric_dict = Lyric.activated.pick_random()
	
	if lyric_dict:
		text = lyric_dict.name
	else:
		text = ". . ."

func _on_toggled(toggled_on: bool) -> void:
	select_new_lyric.emit(lyric_dict, toggled_on)
