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
	"Outside" : "res://scenes/levels/neighborhood.tscn",
	"House" : "res://scenes/levels/house_interior.tscn"
}

var SFX: Dictionary = {
	"Fail" : load("res://assets/sfx/Fail.ogg"),
	"GainFame" : load("res://assets/sfx/GainFame.ogg"),
	"GainInspo" : load("res://assets/sfx/GainInspo.ogg"),
	"GainMoney" : load("res://assets/sfx/GainMoney.ogg"),
	"InspoNodeUnlock" : load("res://assets/sfx/InspoNodeUnlock.ogg"),
	"SaveGame" : load("res://assets/sfx/SaveGame.ogg"),
	"Succes" : load("res://assets/sfx/Success.ogg"),
	"PaperSound" : load("res://assets/sfx/PaperSound2.ogg"),
	"PencilSound" : load("res://assets/sfx/PencilSound3.ogg")
}
