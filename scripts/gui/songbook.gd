extends VBoxContainer

func startup() -> void:
	for child in get_children():
		child.queue_free()

	if !GInit.songbook.is_empty():
		for i in len(GInit.songbook):
			var new_label = Label.new()
			for key in GInit.songbook[i].keys():
				new_label.text = key
			add_child(new_label)
