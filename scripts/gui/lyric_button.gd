extends Button

signal select_new_lyric(dict: Dictionary, toggle: bool)

var lyric_dict: Dictionary


func set_lyric(lyric_id: int) -> void:
	match lyric_id:
		1:
			lyric_dict = Lyric.UPBEAT.pick_random()
		2:
			lyric_dict = Lyric.JOYFUL.pick_random()
		3:
			lyric_dict = Lyric.QUIRKY.pick_random()
		4:
			lyric_dict = Lyric.ANXIOUS.pick_random()
		5:
			lyric_dict = Lyric.MELACHOLY.pick_random()
		6:
			lyric_dict = Lyric.MIXED.pick_random()
		7:
			lyric_dict = Lyric.MIXED.pick_random()
	
	if lyric_dict:
		text = lyric_dict.name

func _on_toggled(toggled_on: bool) -> void:
	select_new_lyric.emit(lyric_dict, toggled_on)
