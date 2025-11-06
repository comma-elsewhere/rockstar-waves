extends Control

@export var lyrics_done_button: Button
@export var lyric_list: VBoxContainer
@export var song_title_label: Label
@export var song_player: AudioStreamPlayer

@export var lyric_recipes: Array[SongRecipe] = []

var current_title: String
var current_lyrics: Array[Dictionary] = []
var current_song: SongResource

func _ready() -> void:
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

func _add_bottom_lyric_list() -> void:
	var new_label = Label.new()
	new_label.text = str(current_lyrics.back().name)
	lyric_list.add_child(new_label)
	
func _remove_at_lyric_list(index: int) -> void:
	lyric_list.remove_child(lyric_list.get_child(index))
	
func refresh_lyric_list() -> void:
	for child in lyric_list.get_children():
		child.queue_free()
		
func _process_lyrics() -> bool:
	var upbeat: int = 0
	var joyful: int = 0
	var quirky: int = 0
	var anxious: int = 0
	var melancholy: int = 0
	
	for lyric in current_lyrics:
		upbeat += lyric.political
		joyful += lyric.joyful
		quirky += lyric.ironic
		anxious += lyric.anxious
		melancholy += lyric.melancholy
		
	var metrics: Array = [upbeat, joyful, quirky, anxious, melancholy]
	
	for amount in metrics:
		amount /= current_lyrics.size()
	
	print(metrics)
	
	current_song = _measure_distance(metrics)
	
	if current_song and _add_to_songbook(current_title):
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
		_add_bottom_lyric_list()
	else:
		_remove_at_lyric_list(current_lyrics.find(dict))
		current_lyrics.remove_at(current_lyrics.find(dict))

func _on_song_title_text_changed(new_text: String) -> void:
	current_title = new_text
	song_title_label.text = current_title
