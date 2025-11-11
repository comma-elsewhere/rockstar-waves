class_name SongButton extends Button

var song_dict: Dictionary

func set_button_info(dict: Dictionary):
	song_dict = dict
	for key in song_dict.keys():
		text = key
