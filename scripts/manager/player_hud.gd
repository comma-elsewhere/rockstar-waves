extends Control

@onready var reticle: ColorRect = $Reticle
@onready var journal: Panel = $JournalBG
@onready var dialogue: MarginContainer = $DialogueContainer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("journal") and !GInit.minigame_open:
		journal.visible = !journal.visible
		get_tree().paused = journal.visible
		GInit.mouse_free = journal.visible
		
func _process(_delta: float) -> void:
	get_tree().paused = journal.visible
	if get_tree().paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func show_reticle(yes_show: bool) -> void:
	reticle.visible = yes_show

func player_talking(words: String):
	dialogue.on_talking(words)
