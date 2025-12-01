extends PanelContainer

@onready var pay_button: Button = $PanelContainer/MarginContainer/VBoxContainer/PayButton
@onready var fail_button: Button = $PanelContainer/MarginContainer/VBoxContainer/FailButton
@onready var label: Label = $PanelContainer/MarginContainer/VBoxContainer/Label

func _ready() -> void:
	GFunc.pay_rent.connect(_rent_popup)
	pay_button.button_up.connect(_continue_game)
	fail_button.button_up.connect(_soft_reset)
	
func _rent_popup(can_pay: bool) -> void:
	if can_pay:
		pay_button.visible = true
	else: 
		fail_button.visible = true
	self.visible = true
	get_tree().paused = true
	GInit.mouse_free = true
	
func _continue_game() -> void:
	self.visible = false
	get_tree().paused = false
	GInit.mouse_free = false
	
func _soft_reset() -> void:
	_continue_game()
	get_tree().change_scene_to_file(Preload.SCENES["House"])
