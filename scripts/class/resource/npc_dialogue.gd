class_name BasicDialogue extends Resource

@export var type_name: String
@export_enum("Friendly", "Neutral", "Hostile") var personality

@export_subgroup("General")
@export var greeting: Array[String]
@export var bump_into: Array[String]
@export var pass_by: Array[String]


func _init() -> void:
	randomize()

func hello() -> String:
	var rand: String = greeting.pick_random()
	return type_name + ": \n" + rand
	
func bump() -> String:
	var rand: String = bump_into.pick_random()
	return type_name + ": \n" + rand
	
func passing() -> String:
	var rand: String = pass_by.pick_random()
	return type_name + ": \n" + rand
