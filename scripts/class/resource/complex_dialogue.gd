class_name ComplexDialogue extends Resource

@export_enum("Barista", "Bouncer") var npc_role: String
@export var dialogue_options: Array[String] = ["","","",""]
@export_group("NPC Dialogue")
@export var fame_steps: Array[int] = [0,0]
@export var greeting_steps: Array[String] = ["","",""]
@export_subgroup("Answers")
@export var answer_steps_0: Array[String] = ["","",""]
@export var answer_steps_1: Array[String] = ["","",""]
@export var answer_steps_2: Array[String] = ["","",""]
@export_group("Venue Details")
@export_enum("Open Mic Night", "Warehouse Bash") var gig_name: String
@export_range(0,7) var gig_day: int
@export_range(0,24) var gig_time: int

const ANSWER := "answer_steps_"
var answer_array := [answer_steps_0, answer_steps_1, answer_steps_2]

func fame_check() -> bool:
	if GInit.world_time[1] < gig_time:
		return false
	else:
		if gig_name == "Open Mic Night":
			return true
		elif GInit.world_time[0] % 7 == gig_day:
			if GStat.current_level >= fame_steps.back():
				return true
			else:
				return false
		else:
			return false

func give_greeting() -> String:
	var select_dialogue: String = greeting_steps.back()
	for i in len(fame_steps):
		if GStat.current_level >= fame_steps[i]:
			select_dialogue = greeting_steps[i]
			return select_dialogue
	return npc_role + ": \n" + select_dialogue

func give_answer(index: int) -> String:
	var select_dialogue: String
	match index:
		0:
			select_dialogue = _get_answer(answer_steps_0)
		1: 
			select_dialogue = _get_answer(answer_steps_1)
		2:
			select_dialogue = _get_answer(answer_steps_2)
	return select_dialogue
	
func _get_answer(array_actual: Array[String]) -> String:
	var select_dialogue: String = array_actual.back()
	for i in len(fame_steps):
		if GStat.current_level >= fame_steps[i]:
			select_dialogue = array_actual[i]
			return select_dialogue
	return npc_role + ": \n" + select_dialogue
