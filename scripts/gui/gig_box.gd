extends VBoxContainer

@onready var gig_name_label: Label = $Name
@onready var location_label: Label = $HBoxContainer/Where
@onready var weekday_label: Label = $HBoxContainer/When
@onready var door_time_label: Label = $HBoxContainer/Time

@export var gig_name: String
@export var location: String
@export var weekday: String
@export var door_time: String

func _ready() -> void:
	gig_name_label.text = gig_name
	location_label.text = location
	weekday_label.text = weekday
	door_time_label.text = door_time
