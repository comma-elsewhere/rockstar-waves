extends Node

#bool for if mouse is captured or visible
var mouse_free: bool = false
var minigame_open: bool = false

#on if the tutorial is incomplete
var tutorial: bool = true
var tutorial_tasks: Array[int] = [0, 0, 0, 0, 0, 0] #mom, dad, unlock node in journal, make first song, busk, get coffee

#array for world time: day, hour, minute
var world_time: Array[int] = [0,0,0]
var week_days: Array[String] = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

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
