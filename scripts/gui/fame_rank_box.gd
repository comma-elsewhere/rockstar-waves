extends Control

@export var rank_names: Array[String] = ["Daydreamer","Soundcloud Singer","Opening Act","Rising Star","Rockstar"]
@export var level_threshhold: int = 100
@export_group("Rank Panels")
@export_subgroup("Main Ranks")
@export var rank_1: PanelContainer
@export var rank_2: PanelContainer
@export var rank_3: PanelContainer
@export var rank_4: PanelContainer
@export var rank_5: PanelContainer
@export_subgroup("Sub Ranks")
@export var subrank_1: PanelContainer
@export var subrank_2: PanelContainer
@export var subrank_3: PanelContainer
@export var subrank_4: PanelContainer
@export_group("Dynamic")
@export var rank_label: Label
@export var level_bar: ProgressBar

var update_fame: int = 0
var level_amount: int = 0
var current_level: int = 0
var current_rank: Control = null
var current_subrank: Control = null

func _ready() -> void:
	_set_label()
		
func _set_label() -> void:
	if GStat.current_level % 4 == 1:
		GStat.current_rank = 1
		toggle_subrank(subrank_1)
	elif GStat.current_level % 4 == 2:
		GStat.current_rank = 2
		toggle_subrank(subrank_2)
	elif GStat.current_level % 4 == 3:
		GStat.current_rank = 3
		toggle_subrank(subrank_3)
	else:
		GStat.current_rank = 4
		toggle_subrank(subrank_4)
		
	var index: int
	if GStat.current_level > 16:
		index = 4
		toggle_rank(rank_5)
	elif GStat.current_level > 12:
		index = 3
		toggle_rank(rank_4)
	elif GStat.current_level > 8:
		index = 2
		toggle_rank(rank_3)
	elif GStat.current_level > 4:
		index = 1
		toggle_rank(rank_2)
	else:
		index = 0
		toggle_rank(rank_1)
	
	level_bar.max_value = GStat.threshholds[index]
	level_bar.value = GStat.fame % GStat.threshholds[index]
	rank_label.text = rank_names[index] + "\n" + "Level " + str(GStat.current_rank)
	
func toggle_subrank(panel: Control) -> void:
	if current_subrank:
		current_subrank.visible = false
	current_subrank = panel
	_show_panel(current_subrank)
	
func toggle_rank(panel: Control) -> void:
	if current_rank:
		current_rank.visible = false
	current_rank = panel
	_show_panel(current_rank)
	
func _show_panel(panel: Control):
	panel.visible = true
	await get_tree().create_timer(2.5).timeout
	if GStat.current_level > 1:
		GFunc.play_sound(self, "GainFame")
