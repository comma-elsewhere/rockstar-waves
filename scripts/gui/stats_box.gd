extends VBoxContainer

@export_enum("Generic", "Player") var type: int = 0

@onready var money: Label = $Money/Dynamic
@onready var fame: Label = $Fame/Dynamic
@onready var inspiration: Label = $Inspiration/Dynamic

func _process(_delta: float) -> void:
	if type == 1:
		money.text = "$" + str(GStat.money)
		inspiration.text = str(GStat.inspo_points)

func update_labels(new_money: int, new_fame: int) -> void:
	money.text = "$" + str(new_money)
	fame.text = str(new_fame)
