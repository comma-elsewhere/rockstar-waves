extends CanvasLayer

@export var news_title: Label
@export var body_1: Label
@export var body_2: Label

const INSPO := 5

var day_to_str: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_to_str = str(GInit.world_time[0] % 10)
	news_title.text = Paper.NEWS[day_to_str]["title"]
	body_1.text = Paper.NEWS[day_to_str]["body1"]
	body_2.text = Paper.NEWS[day_to_str]["body2"]
	_get_inspired()

func _get_inspired() -> void:
	if Paper.NEWS[day_to_str]["read"] == false:
		GFunc.play_sound(self, "GainInspo")
		GStat.inspo_points += INSPO
		Paper.NEWS[day_to_str]["read"] = true
	
