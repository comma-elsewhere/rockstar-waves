class_name BasicDialogue extends Resource

@export_enum("PATRON: \n", "NEIGHBOR: \n", "PEDESTRIAN: \n") var type: String
@export_enum("Friendly", "Neutral", "Hostile") var personality

@export_subgroup("General")
@export var greeting: Array[String]
@export var bump_into: Array[String]
@export var pass_by: Array[String]


func _init() -> void:
	randomize()

func hello() -> String:
	var rand: String = greeting.pick_random()
	GStat.inspo_points += 1
	return type+rand
	
func bump() -> String:
	var rand: String = bump_into.pick_random()
	GStat.inspo_points += 1
	return type+rand
	
func passing() -> String:
	var rand: String = pass_by.pick_random()
	GStat.inspo_points += 5
	return type+rand
