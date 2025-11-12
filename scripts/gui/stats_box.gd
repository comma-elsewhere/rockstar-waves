extends VBoxContainer

@onready var money: Label = $Money/Dynamic
@onready var fame: Label = $Fame/Dynamic
@onready var inspo: Label = $Inspiration/Dynamic

func _process(_delta: float) -> void:
	money.text = str(GStat.money)
	fame.text = str(GStat.fame)
	inspo.text = str(GStat.inspo_points)
