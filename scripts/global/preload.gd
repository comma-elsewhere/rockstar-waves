extends Node

const HUD: Dictionary = {
	Perform = preload("res://scenes/minigames/perform_hud.tscn"),
	Song = preload("res://scenes/minigames/song_hud.tscn"),
	Busk = preload("res://scenes/minigames/busk_hud.tscn"), 
	Inspire = preload("res://scenes/minigames/idea_hud.tscn")
}

const COMP: Dictionary = {
	Note = preload("res://prefabs/components/rhythm_note.tscn")
}

const SCENES: Dictionary = {
	Outside = "res://scenes/levels/neighborhood.tscn",
	House = "res://scenes/levels/house_interior.tscn"
}
