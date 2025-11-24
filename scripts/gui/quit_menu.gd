extends MarginContainer

@export var parent: Panel
@export var quit_button: Button
@export var open_menu: Button
@export var close_menu: Button

func _ready() -> void:
	quit_button.button_up.connect(_quit_game)
	open_menu.button_up.connect(_toggle_menu.bind(true))
	close_menu.button_up.connect(_toggle_menu.bind(false))

func _input(event: InputEvent) -> void:
	if parent.visible:
		if event.is_action_pressed("escape") and visible:
			_toggle_menu(false)
		elif event.is_action_pressed("escape") and !visible:
			_toggle_menu(true)

func _quit_game() -> void:
	get_tree().quit()

func _toggle_menu(open_menu_bool: bool) -> void:
	visible = open_menu_bool
