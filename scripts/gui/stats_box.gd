extends VBoxContainer

@onready var money: Label = $Money/Dynamic
@onready var inspo: Label = $Inspiration/Dynamic

func _process(_delta: float) -> void:
	money.text = str(GStat.money)
	inspo.text = str(GStat.inspo_points)
