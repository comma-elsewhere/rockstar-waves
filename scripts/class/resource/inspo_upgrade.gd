class_name LyricUpgrade extends Resource

@export var inspo_cost: int = 10
@export_range(1,3) var upgrade_max: int = 3
@export var upgrade_name: String
@export_enum("EMO", "PUNK") var upgrade_branch: int = 1
@export var upgrade_texture: Texture2D
@export_subgroup("Lyrics")
@export var lyrics: Array[String] = ["", "", "", "", "","", "", "", "", ""]
@export var grouping: Array[int] = [0,0,0]
@export var metric_one: Array[int] = [0,0,0,0,0]
@export var metric_two: Array[int] = [0,0,0,0,0]
@export var metric_three: Array[int] = [0,0,0,0,0]

#Metrics:
	#upbeat/political
	#joyful
	#anxious
	#ironic/quirky
	#melancholy

func upgrade(level: int):
	GStat.music_style[upgrade_branch] += 1
	GStat.upgrades[upgrade_name] = level
	for i in range(grouping[level - 1]):
		var current_lyric: String = lyrics.pop_front()
		var lyric_dict: Dictionary
		match level:
			1:
				lyric_dict[current_lyric] = _random_metric(metric_one)
			2:
				lyric_dict[current_lyric] = _random_metric(metric_two)
			3:
				lyric_dict[current_lyric] = _random_metric(metric_three)
		GInit.active_lyrics.append(lyric_dict)

func _random_metric(array: Array[int]) -> Array[int]:
	var randomized_array: Array[int]
	for i in range(len(array)):
		if array[i] == 0:
			randomized_array.append(0)
		else:
			randomized_array.append(randi_range(1, i))
	return randomized_array
