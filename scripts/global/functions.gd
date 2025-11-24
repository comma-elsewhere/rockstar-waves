extends Node

func norm_fame() -> int:
	var normalized_fame: int = GStat.current_level /2
	return normalized_fame

func venue_quality(quality: int) -> bool:
	if quality == 0:
		return true
	elif quality * 2 <= norm_fame():
		return true
	else:
		return false
