class_name UpgradeNode extends Control

@export var res: LyricUpgrade
@export var parent_upgrade: UpgradeNode
@export var parent_pos: Vector2
@export var children: Array[UpgradeNode]
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
	button.texture_normal = res.upgrade_texture
	button.tooltip_text = res.upgrade_name
	current_cost = res.inspo_cost
	
	button.button_up.connect(_on_button_pressed)
	
	_update_label()
	unlocked_panel.visible = false
	_set_line()
	
	if GStat.upgrades.get(res.upgrade_name) != null:
		var value: int = GStat.upgrades.get(res.upgrade_name)
		call_deferred("_already_enabled", value)
	
func _on_button_pressed():
	if GStat.inspo_points >= current_cost and current_level < res.upgrade_max:
		GStat.inspo_points -= current_cost
		if current_level < 1:
			_unlock()
		current_level += 1
		current_cost *= COST_MULTIPLIER
		_update_label()
		res.upgrade(current_level)

func _unlock():
	unlocked_panel.visible = true
	if !children.is_empty():
		for node in children:
			node.enable_self()

func _update_label() -> void:
	upgrade_label.text = res.upgrade_name + " " + str(current_level) + "/" + str(res.upgrade_max)
	if current_level >= res.upgrade_max:
		cost_label.visible = false
	else:
		cost_label.text = str(current_cost)
	
func enable_self():
	cost_label.visible = true
	locked_panel.visible = true
	button.disabled = false
	line.default_color = unlocked_line

func _set_line() -> void:
	if parent_upgrade:
		line = Line2D.new()
		add_child(line)
		line.add_point(parent_pos + size/2)
		#line.add_point(parent_upgrade.global_position)
		line.add_point(Vector2.ZERO + size/2)
		line.default_color = locked_line
		line.z_index = -1
		
		button.disabled = true
		locked_panel.visible = false
		cost_label.visible = false
	else:
		locked_panel.visible = true

func get_local_position(child_position: Vector2) -> Vector2:
	var omega = global_position.angle_to_point(child_position)
	var dist = global_position.distance_to(child_position)
	var opp = sin(omega) * dist
	var adj = cos(omega) * dist
	var my_position: Vector2 = Vector2(adj, opp)
	
	return my_position

func _already_enabled(level: int) -> void:
	if parent_upgrade:
		enable_self()
	current_level = level
	for i in level:
		if i != 0:
			current_cost *= COST_MULTIPLIER
	_unlock()
	_update_label()
