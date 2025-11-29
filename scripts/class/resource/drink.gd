class_name DrinkRes extends Resource

@export var texture: AtlasTexture
@export var drink_name: String
@export var price: float
@export var inspo_amount: int

func buy_drink() -> bool:
	if price <= GStat.money:
		GStat.money -= price
		GStat.inspo_points += inspo_amount
		return true
	else:
		return false
