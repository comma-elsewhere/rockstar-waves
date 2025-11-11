extends CanvasLayer

signal game_over

@export var stage_manager: StageManager
@export var song_button_box: VBoxContainer

func startup() -> void:
	GInit.mouse_free = true
	song_button_box.startup()

func _on_song_button_box_song_selected(song_dict: Dictionary) -> void:
	for value in song_dict.values():
		stage_manager.set_song(value)


func _on_score_display_end_game(_score: int) -> void:
	game_over.emit()
