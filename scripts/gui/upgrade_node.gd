class_name UpgradeNode extends Control

@export var res: LyricUpgrade
@export var parent_upgrade: UpgradeNode
@export var locked_line: Color
@export var unlocked_line: Color

@onready var button: TextureButton = $TextureButton
@onready var locked_panel: PanelContainer = $LockedPanel
@onready var unlocked_panel: PanelContainer = $UnlockedPanel
@onready var cost_label: Label = $TextureButton/MarginContainer/Label
@onready var upgrade_label: Label = $Spacer/MarginSpacer/NameLabel

const COST_MULTIPLIER: int = 2

var line: Line2D
var current_level: int = 0
var current_cost: int

func _ready() -> void:
	if parent_upgrade:
		line = Line2D.new()
		add_child(line)
		line.add_point(global_position + size/2)
		line.add_point(parent_upgrade.global_position + size/2)
		line.default_color = locked_line
		line.z_index = -1
		button.disabled = true
		locked_panel.visible = false
		cost_label.visibel = false
	else:
		locked_panel.visible = true
	unlocked_panel.visible = false
	button.texture_normal = res.upgrade_texture
	button.tooltip_text = res.upgrade_name
	button.button_up.connect(_on_button_pressed)
	current_cost = res.inspo_cost
	_update_label()
	
func _on_button_pressed():
	if GStat.inspo_points >= res.inspo_cost and current_level < res.upgrade_max:
		GStat.inspo_points -= res.inspo_cost
		if current_level < 1:
			var children: Array = get_children()
			if !children.is_empty():
				for node in children:
					if node.has_method("enable_self"):
						node.enable_self()
			unlocked_panel.visible = true
			line.default_color = unlocked_line
		current_level += 1
		current_cost *= COST_MULTIPLIER
		_update_label()

func _update_label() -> void:
	upgrade_label.text = res.upgrade_name + " " + str(current_level) + "/" + str(res.upgrade_max)
	cost_label.text = str(current_cost)
	
func enable_self():
	cost_label.visible = true
	locked_panel.visible = true
	button.disabled = false
