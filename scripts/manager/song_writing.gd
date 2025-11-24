extends Control

signal game_end

@export var lyrics_done_button: Button
@export var lyric_list: VBoxContainer
@export var song_title_label: Label
@export var song_player: AudioStreamPlayer

@export var lyric_recipes: Array[SongRecipe] = []

const WAIT_END := 6.0

var current_title: String
var current_lyrics: Array[Dictionary] = []
var current_song: SongResource

func _ready() -> void:
	GInit.mouse_free = true
	lyrics_done_button.button_up.connect(_proceed_to_tuning)
	$HBoxContainer/WorkPanel/LyricContainer.visible = true
	$HBoxContainer/WorkPanel/TuningContainer.visible = false
	
func _proceed_to_tuning() -> void:
	if current_lyrics.size() < 3:
		pass
	elif current_lyrics.size() > 3:
		pass
	else:
		if _process_lyrics() and current_title:
			$HBoxContainer/WorkPanel/LyricContainer.visible = false
			$HBoxContainer/WorkPanel/TuningContainer.visible = true
			song_player.stream = current_song.audio_stream
		
func _process_lyrics() -> bool:
	var metrics: Array = [0,0,0,0,0]
	
	for lyric in current_lyrics:
		for value in lyric.values():
			for i in range(len(value)):
				metrics[i] += value[i]
	
	for i in range(len(metrics)):
		metrics[i] /= 2
	
	print(metrics)
	
	current_song = _measure_distance(metrics)
	
	if current_song:
		return true
	else:
		return false

func _add_to_songbook(song_name: String) -> bool:
	var song_dict: Dictionary = {song_name: current_song}
	if GInit.songbook.has(song_dict):
		return false
	else:
		GInit.songbook.append(song_dict)
		return true
	
func _measure_distance(metrics: Array) -> SongResource:
	var metric_distance = 0
	var shortest_distance = 10000
	var closest_song = null
	for recipe in lyric_recipes:
		var recipe_metrics: Array = recipe.get_recipe()
		for i in range(metrics.size()):
			metric_distance += (metrics[i] - recipe_metrics[i])**2
		metric_distance = sqrt(metric_distance)
		if metric_distance < shortest_distance:
			shortest_distance = metric_distance
			closest_song = recipe.song
	return closest_song

func _on_new_lyric_from_button(dict: Dictionary, toggle: bool) -> void:
	if toggle:
		current_lyrics.append(dict)
	else:
		current_lyrics.remove_at(current_lyrics.find(dict))

func _on_song_title_text_changed(new_text: String) -> void:
	current_title = new_text
	song_title_label.text = current_title


func _on_tuning_container_puzzle_is_solved() -> void:
	_add_to_songbook(current_title)


func _on_play_button_pressed() -> void:
	await get_tree().create_timer(WAIT_END).timeout
	game_end.emit()
