extends CanvasLayer

signal game_over

const PANEL_WAIT := 5.0

@export_enum("Busk", "Perform") var type: String
@export var stage_manager: StageManager
@export var song_button_box: VBoxContainer
@export var final_panel: PanelContainer
@export var stats_box: VBoxContainer

var level

func startup(zone_quality: float) -> void:
	level = float(GFunc.norm_fame() + (GStat.music_style[0] + GStat.music_style[1])/2) * zone_quality
	GInit.mouse_free = true
	song_button_box.startup()

func _on_song_button_box_song_selected(song_dict: Dictionary) -> void:
	for value in song_dict.values():
		stage_manager.set_song(value)


func _on_score_display_end_game(score_array: Array) -> void:
	if type == "Busk":
		await _calculate_busking(score_array)
	else:
		await _calculate_performance(score_array)
	game_over.emit()

func _calculate_busking(score_info: Array) -> bool:
	level = clampi(level, 1, 10)
	var floored_money: float = level * randf_range(0.1, 2) * score_info[0]
	var gained_fame: int = level * ((score_info[2] + score_info[3]) / 4) * score_info[0] / 5
	
	if GInit.tutorial:
		GFunc.finish_tutorial_task(4)
	
	await final_calc(floored_money, gained_fame)
	return true

func _calculate_performance(score_info: Array) -> bool:
	level = clampi(level, 1, 20)
	var floored_money: float = level * randf_range(5,10) * score_info[0] 
	var gained_fame: int = level * ((score_info[2] + score_info[3]) / 4) * score_info[0] / 2
	
	await final_calc(floored_money, gained_fame)
	return true
	
func final_calc(floored_money:float, gained_fame:int) -> void:
	floored_money = snappedf(floored_money, 0.01)
	
	if floored_money > 0:
		GFunc.play_sound(self, "GainMoney")
	
	GStat.money += floored_money
	GFunc.add_fame(gained_fame)
	
	stats_box.update_labels(floored_money, gained_fame)
	final_panel.visible = true
	await get_tree().create_timer(PANEL_WAIT).timeout
