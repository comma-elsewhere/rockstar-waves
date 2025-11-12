extends Control

@onready var reticle: ColorRect = $Reticle
@onready var journal_bg: Panel = $JournalBG

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("journal"):
		visible = !visible
		get_tree().paused = visible
		GInit.mouse_free = visible

func show_reticle(yes_show: bool) -> void:
	reticle.visible = yes_show
