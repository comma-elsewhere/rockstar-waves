extends VBoxContainer

@export var res: DrinkRes

func _ready() -> void:
	$HBoxContainer/IconRect.texture = res.texture
	$HBoxContainer/NameLabel.text = res.drink_name
	$HBoxContainer2/InspoLabel.text = "Inspiration: " + str(res.inspo_amount)
	$HBoxContainer2/PriceLabel.text = "Price: $" + str(res.price)
	


func _on_buy_buton_button_up() -> void:
	if res.buy_drink():
		GFunc.play_sound(self, "DrinkBev")
	else:
		GFunc.play_sound(self, "Fail")
