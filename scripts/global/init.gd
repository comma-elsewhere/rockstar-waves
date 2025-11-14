extends Node

#bool for if mouse is captured or visible
var mouse_free: bool = false
var minigame_open: bool = false

#initiate and access storage for player-made songs
#dictionary is formatted as -- {song_title:String = song:SongResource}
var songbook: Array[Dictionary] = []
var active_lyrics: Array[Dictionary] = []

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
func _process(_delta: float) -> void:
	if mouse_free:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
