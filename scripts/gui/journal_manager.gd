extends Panel

@export_group("Panels")
@export var calendar_panel: MarginContainer
@export var upgrades_panel: MarginContainer
@export var gear_panel: MarginContainer
@export var options_panel: MarginContainer
@export_group("Buttons")
@export var calendar_button: Button
@export var upgrades_button: Button
@export var gear_button: Button
@export var options_button: Button

var current_panel: Control

func _ready() -> void:
	calendar_button.button_up.connect(_toggle_panel.bind(calendar_panel))
	upgrades_button.button_up.connect(_toggle_panel.bind(upgrades_panel))
	gear_button.button_up.connect(_toggle_panel.bind(gear_panel))
	options_button.button_up.connect(_toggle_panel.bind(options_panel))
	
	current_panel = upgrades_panel
	_show_panel(current_panel)
	visible = false
	
func _toggle_panel(panel: Control) -> void:
	if current_panel:
		current_panel.visible = false
	current_panel = panel
	_show_panel(current_panel)
	
func _show_panel(panel: Control):
	panel.visible = true
