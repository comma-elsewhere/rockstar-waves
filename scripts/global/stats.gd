extends Node

var mouse_sensitivity: float = 0.3

var upgrades: Dictionary
var threshholds: Array[int] = [70, 140, 280, 560, 1120]
var current_rank: int = 1
var current_level: int

var music_style: Array[int] = [0,0]

var money: float = 0.69
var fame: int
var inspo_points: int = 25
var gear: Dictionary = {
	Guitar = 0,
	Digital = 0,
	Keyboard = 0,
	Fashion = 0
}

func _ready() -> void:
	current_level = 1
	GFunc.add_fame(0)
