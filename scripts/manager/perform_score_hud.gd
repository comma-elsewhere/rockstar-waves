extends Control

signal end_game(array: Array)

@export var active_score_box: MarginContainer
@export var final_score_box: PanelContainer
@export var done_button: Button
@export_subgroup("Active Labels")
@export var active_score: Label
@export var active_combo: Label
@export_subgroup("Final Labels")
@export var final_score: Label
@export var final_combo: Label
@export var final_perfect: Label
@export var final_good: Label
@export var final_okay: Label
@export var final_missed: Label

var score_array: Array = []

func _ready() -> void:
	done_button.pressed.connect(_finish_minigame)
	final_score_box.visible = false
	active_score.text = ""
	active_combo.text = ""
	
func update_score(score: int, combo: int) -> void:
	active_score.text = str(score)
	if combo > 0:
		active_combo.text = "x" + str(combo)
	else: 
		active_combo.text = ""
	
func _finish_minigame():
	end_game.emit(score_array)

func _on_stage_manager_song_ended(score: int, combo: int, perfect: int, good: int, okay: int, missed: int) -> void:
	GInit.mouse_free = true
	
	final_score.text = str(score)
	final_combo.text = str(combo)
	final_perfect.text = str(perfect)
	final_good.text = str(good)
	final_okay.text = str(okay)
	final_missed.text = str(missed)
	
	var total_notes: float = perfect + good + okay + missed
	var score_percentage = float((total_notes - missed) / total_notes)
	score_array = [score_percentage, score, combo, perfect]
	
	final_score_box.visible = true
	active_score_box.visible = false
