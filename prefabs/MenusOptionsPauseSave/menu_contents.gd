extends PanelContainer

const NEW_GAME := "res://scenes/levels/house_interior.tscn"



func _on_start_button_button_up() -> void:
	GInit.mouse_free = false
	get_tree().change_scene_to_file(NEW_GAME)



func _on_quit_button_button_up() -> void:
	get_tree().quit()



func _on_confirm_button_button_up() -> void:
	pass # Replace with function body.
