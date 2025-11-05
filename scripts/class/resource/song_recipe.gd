class_name SongRecipe extends Resource

@export var song: SongResource
@export_range(0,3) var upbeat:int = 0
@export_range(0,3) var joyful:int = 0
@export_range(0,3) var quirky:int = 0
@export_range(0,3) var melancholy:int = 0
@export_range(0,3) var anxious:int = 0

var recipe: Array[int] = []

func get_recipe() -> Array[int]:
	recipe = [upbeat, joyful, quirky, anxious, melancholy]

	return recipe

func add_to_songbook(song_name: String) -> bool:
	var song_dict: Dictionary = {song_name: song}
	if GInit.songbook.has(song_dict):
		return false
	else:
		GInit.songbook.append(song_dict)
		return true
