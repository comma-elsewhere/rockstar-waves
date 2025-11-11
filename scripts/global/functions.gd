extends Node



#Lyric types: DREAM, PARK, BOOK, NEWS, FAMILY, FLIRT -- Don't use PARK rn
func fetch_lyric(lyric_type: String) -> Dictionary:
	var select_lyric: Dictionary
	var temp_array: Array[Dictionary] = []
	for value in Lyric.lyric_type.values():
		temp_array.append(value)
	select_lyric = temp_array.pick_random()
	
	return select_lyric
