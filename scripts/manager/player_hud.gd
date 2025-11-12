extends Control

@onready var reticle: ColorRect = $Reticle
@onready var journal: Panel = $JournalBG

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("journal"):
		journal.visible = !journal.visible
		get_tree().paused = journal.visible
		GInit.mouse_free = journal.visible
		
func _process(_delta: float) -> void:
	if journal.visible:
		get_tree().paused = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func show_reticle(yes_show: bool) -> void:
	reticle.visible = yes_show
