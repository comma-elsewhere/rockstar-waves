extends CanvasLayer

signal game_over

var possible_inspiration: int

func _on_idea_catcher_catch_game_ended(idea_caught: bool) -> void:
	if idea_caught: 
		GStat.inspo_points += possible_inspiration
	else: 
		GStat.inspo_points += possible_inspiration / 2
	game_over.emit()
		

func set_inspo(inspo: int) -> void:
	possible_inspiration = inspo
