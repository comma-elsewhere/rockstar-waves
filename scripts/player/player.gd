extends Character

@export var walk_speed: int = 12
@export var run_speed: int = 20
@export var jump_height: int = 8

signal entered_game(game_name:String)
signal exited_game()


func _on_detection_zone_area_entered(area: Area3D) -> void:
	if area.is_in_group("Minigame"):
		entered_game.emit(area.game_name)


func _on_detection_zone_area_exited(area: Area3D) -> void:
	if area.is_in_group("Minigame"):
		exited_game.emit()
