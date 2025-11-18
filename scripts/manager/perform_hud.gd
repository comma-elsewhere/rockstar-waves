extends CanvasLayer

signal game_over

const PANEL_WAIT := 5.0

@export_enum("Busk", "Perform") var type: String
@export var stage_manager: StageManager
@export var song_button_box: VBoxContainer
@export var final_panel: PanelContainer


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
	var fame = GStat.fame / 10
	fame = clampi(fame, 1, 10)
	var floored_money = 0
	floored_money += float(fame) * randf_range(0.1, 5) * score_info[0]
	floored_money = snapped(floored_money, 0.01)
	
	GStat.money += floored_money
	GStat.fame += score_info[3] * score_info[0] / 100
	GStat.inspo_points += score_info[2] * score_info[0] / 2
	
	final_panel.visible = true
	await get_tree().create_timer(PANEL_WAIT).timeout
	
	return true
