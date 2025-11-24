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

func _process(_delta: float) -> void:
	if update_fame != GStat.fame:
		update_fame = GStat.fame
		_process_level(update_fame)
		_set_label()
		
func _set_label() -> void:
	var level: int
	if current_level % 4 == 1:
		level = 1
		toggle_subrank(subrank_1)
	elif current_level % 4 == 2:
		level = 2
		toggle_subrank(subrank_2)
	elif current_level % 4 == 3:
		level = 3
		toggle_subrank(subrank_3)
	else:
		level = 4
		toggle_subrank(subrank_4)
		
	var index: int
	if current_level > 16:
		index = 4
		toggle_rank(rank_5)
	elif current_level > 12:
		index = 3
		toggle_rank(rank_4)
	elif current_level > 8:
		index = 2
		toggle_rank(rank_3)
	elif current_level > 4:
		index = 1
		toggle_rank(rank_2)
	else:
		index = 0
		toggle_rank(rank_1)
	
	level_threshhold = GStat.threshholds[index]
	level_bar.max_value = level_threshhold
	rank_label.text = rank_names[index] + "\n" + "Level " + str(level)
	
	GStat.current_rank = index + 1
	GStat.current_level = current_level
	
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
		
func _process_level(fame_count: int) -> void:
	level_bar.value = fame_count % level_threshhold
	if fame_count - level_amount >= level_threshhold:
		level_amount += level_threshhold
		if fame_count - level_amount >= level_threshhold:
			_process_level(fame_count)
		else:
			current_level = int(level_amount / level_threshhold)
			current_level = clampi(current_level, 1, 20)
	
	
