extends CanvasLayer

signal state_changed(new_state: String)

@export var npc_dialogue: Label 
@export var option_0: Button
@export var option_1: Button
@export var option_2: Button
@export var option_3: Button

const WAIT := 5.0

var res: ComplexDialogue
var option_array: Array[Button]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("backout"):
		change_state("Idle")

func setup() -> void:
	option_array = [option_0, option_1, option_2, option_3]
	npc_dialogue.text = res.give_greeting()
	for i in len(res.dialogue_options):
		option_array[i].text = res.dialogue_options[i]
	
	option_0.button_up.connect(get_dialogue.bind(0))
	option_1.button_up.connect(get_dialogue.bind(1))
	option_2.button_up.connect(get_dialogue.bind(2))
	
	if res.npc_role == "Barista":
		option_1.button_up.connect(change_state.bind("Shop"))
	if res.fame_check() == true:
		option_2.button_up.connect(change_state.bind("Perform"))
	option_3.button_up.connect(change_state.bind("Idle"))

func get_dialogue(index: int) -> void:
	npc_dialogue.text = res.give_answer(index)

func change_state(state_name: String):
	await get_tree().create_timer(WAIT).timeout
	state_changed.emit(state_name)
