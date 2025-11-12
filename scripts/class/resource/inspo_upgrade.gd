class_name LyricUpgrade extends Resource

@export var inspo_cost: int
@export_range(1,5) var upgrade_max: int = 3
@export var upgrade_name: String
@export_enum("Emo", "Punk", "Metal") var upgrade_branch: String
@export var upgrade_texture: Texture2D
@export_subgroup("Lyrics")
@export var lyric_1: String
@export var lyric_2: String
@export var lyric_3: String
@export var lyric_4: String
@export var lyric_5: String
@export_subgroup("Metrics")
@export_range(0,5) var joyful: int = 0
@export_range(0,5) var ironic: int = 0
@export_range(0,5) var anxious: int = 0
@export_range(0,5) var political: int = 0
@export_range(0,5) var melancholy: int = 0
