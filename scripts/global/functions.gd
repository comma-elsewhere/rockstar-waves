extends Node

signal level_up
signal task_finished

#run this every time a tutorial ask is complete
func finish_tutorial_task(index: int) -> void:
	GInit.tutorial_tasks[index] += 1
	GInit.tutorial = _finish_tutorial()
	task_finished.emit()

func _finish_tutorial() -> bool:
	for i in GInit.tutorial_tasks:
		if i == 0:
			return false
	return true

func add_fame(amount: int) -> void:
	var index: int
	if GStat.current_level > 16:
		index = 4
	elif GStat.current_level > 12:
		index = 3
	elif GStat.current_level > 8:
		index = 2
	elif GStat.current_level > 4:
		index = 1
	else:
		index = 0
		
	if (GStat.fame % GStat.threshholds[index]) + amount >= GStat.threshholds[index]:
		GStat.current_level += 1
	level_up.emit()
	GStat.fame += amount

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

func play_sound(parent_node: Node, sound_name: String) -> bool:
	var loaded_sound = Preload.SFX[sound_name]
	if loaded_sound != null:
		var new_audio := AudioStreamPlayer.new()
		new_audio.stream = loaded_sound
		parent_node.add_child(new_audio)
		new_audio.play(_sound_offset(sound_name))
		await new_audio.finished
		new_audio.call_deferred("queue_free")
		return true
	return false

func _sound_offset(sound_name: String) -> float:
	var offset: float = 0.0
	match sound_name:
		"Fail":
			offset = 0.86
		"GainFame":
			offset = 0.2
		"GainInspo":
			offset = 0.54
		"GainMoney":
			offset = 0.86
		"InspoNodeUnlock":
			offset = 1.45
		"SaveGame":
			offset = 1.01
		"Succes":
			offset = 0.24
		"PaperSound":
			offset = 0.73
		"PencilSound":
			offset = 0.89
	return offset
