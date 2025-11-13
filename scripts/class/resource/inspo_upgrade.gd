class_name LyricUpgrade extends Resource

@export var inspo_cost: int = 5
@export_range(1,5) var upgrade_max: int = 3
@export var upgrade_name: String
@export_enum("EMO", "PUNK") var upgrade_branch: int = 1
@export var upgrade_texture: Texture2D = load("res://assets/icons/skill-icons/skill_icons1/1/Skill-icons_01.png")

func upgrade(level: int):
	var upgrade_access: String = upgrade_name + str(level)
	match upgrade_branch:
		0:
			Lyric.activated.append_array(Lyric.EMO.get(upgrade_access))
		1:
			Lyric.activated.append_array(Lyric.PUNK.get(upgrade_access))
