extends CanvasLayer

signal game_over

const PANEL_WAIT := 5.0

@export_enum("Busk", "Perform") var type: String
@export var stage_manager: StageManager
@export var song_button_box: VBoxContainer
@export_subgroup("Final Panel")
@export var panel: PanelContainer
@export var money_label: Label
@export var fame_label: Label
@export var inspo_label: Label


func startup() -> void:
	GInit.mouse_free = true
	song_button_box.startup()

func _on_song_button_box_song_selected(song_dict: Dictionary) -> void:
	for value in song_dict.values():
		stage_manager.set_song(value)


func _on_score_display_end_game(score_array: Array) -> void:
	if type == "Busk":
		await _calculate_busking(score_array)
	else:
		pass
	game_over.emit()

func _calculate_busking(score_info: Array) -> bool:
	var fame = GStat.fame
	fame = clampi(fame, 1, 10)
	
	GStat.money += fame * randf_range(0.1, 5) * score_info[0]
	GStat.fame += score_info[3] * score_info[0] / 10
	GStat.inspo_points += score_info[2] * score_info[0]
	
	money_label.text = str(GStat.money)
	fame_label.text = str(GStat.fame)
	inspo_label.text = str(GStat.inspo_points)
	panel.visible = true
	await get_tree().create_timer(PANEL_WAIT).timeout
	
	return true
