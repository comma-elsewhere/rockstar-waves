extends Character

@export var walk_speed: int = 12
@export var run_speed: int = 20
@export var jump_height: int = 8

signal entered_game(game_name:String)
signal exited_game()

var store_area: Node3D = null
var hold_inspo: int = 0
var zone_quality: float = 0

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and store_area:
		if store_area.has_method("disable_minute"):
			store_area.disable_minute()
			store_area = null


func _on_detection_zone_area_entered(area: Area3D) -> void:
	if area.is_in_group("Minigame"):
		entered_game.emit(area.game_name)
		store_area = area


func _on_detection_zone_area_exited(area: Area3D) -> void:
	if area.is_in_group("Minigame"):
		exited_game.emit()
		store_area = null

func receive_talking(words: String):
	$CamOrigin/CamArm/Camera/CanvasLayer/PlayerHUD.player_talking(words)
