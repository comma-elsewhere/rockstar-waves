extends Control

@export var player: Character

@onready var reticle: ColorRect = $Reticle
@onready var journal: Panel = $JournalBG
@onready var dialogue: MarginContainer = $DialogueContainer
@onready var interact_display: PanelContainer = $HUD/InteractDisplay


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("journal") and !GInit.minigame_open:
		toggle_journal()
	if event.is_action_pressed("escape") and journal.visible == true:
		toggle_journal()
		
func _process(_delta: float) -> void:
	if get_tree().paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if player.store_area == null:
		interact_display.visible = false
	else:
		interact_display.visible = true

func show_reticle(yes_show: bool) -> void:
	reticle.visible = yes_show

func player_talking(words: String):
	dialogue.on_talking(words)

func toggle_journal() -> void:
	GFunc.play_sound(journal, "PaperSound")
	journal.visible = !journal.visible
	get_tree().paused = journal.visible
	GInit.mouse_free = journal.visible
