extends CanvasLayer

signal game_over


func _on_song_writing_center_game_end() -> void:
	game_over.emit()
