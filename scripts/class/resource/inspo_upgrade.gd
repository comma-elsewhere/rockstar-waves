class_name LyricUpgrade extends Resource

@export var inspo_cost: int = 5
@export_range(1,5) var upgrade_max: int = 3
@export var upgrade_name: String = "Daydream"
@export_enum("NONE", "EMO", "PUNK", "METAL") var upgrade_branch: int
@export var upgrade_texture: Texture2D = load("res://assets/icons/skill-icons/skill_icons1/1/Skill-icons_01.png")

func upgrade(level: int):
	var upgrade_access: String = upgrade_name + str(level)
	match upgrade_branch:
		0:
			Lyric.activated.append_array(Lyric.NONE.get(upgrade_access))
		
