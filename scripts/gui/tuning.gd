extends MarginContainer

@export var current_song: AudioStreamPlayer
@export var real_line: Line2D
@export var imaginary_line: Line2D
@export_subgroup("Slider")
@export var slider_one: VSlider
@export var slider_two: VSlider
@export var slider_three: VSlider
@export var slider_four: VSlider
@export_subgroup("Button")
@export var button_one: Button
@export var button_two: Button
@export var button_three: Button
@export var button_four: Button
@export_subgroup("Colors")
@export var button_color_one: Color
@export var button_color_two: Color
@export var button_color_three: Color
@export var button_color_four: Color

const LINE_LENGTH:float = 560

const VAR1: float = 0.5
const VAR2: float = 1
const VAR3: float = 2
const VAR4: float = 3

var button_one_omega: float
var button_two_omega: float
var button_three_omega: float
var button_four_omega: float

var omega: float
var line_segments: int = 50

var ready_done: bool = false

func _ready() -> void:
	_set_values()
	_modulate_colors()
	_set_line()
	_adjust_line(0)
	
	slider_one.value_changed.connect(_adjust_line)
	slider_two.value_changed.connect(_adjust_line)
	slider_three.value_changed.connect(_adjust_line)
	slider_four.value_changed.connect(_adjust_line)
	
	slider_one.value_changed.connect(_pitch_change)
	slider_two.value_changed.connect(_pitch_change)
	slider_three.value_changed.connect(_pitch_change)
	slider_four.value_changed.connect(_pitch_change)
	
	button_one.pressed.connect(_button_changed.bind(1))
	button_two.pressed.connect(_button_changed.bind(2))
	button_three.pressed.connect(_button_changed.bind(3))
	button_four.pressed.connect(_button_changed.bind(4))
	
	ready_done = true
	
func _set_values() -> void:
	randomize()
	slider_one.value = randf_range(0, 100)
	slider_two.value = randf_range(0, 100)
	slider_three.value = randf_range(0, 100)
	slider_four.value = randf_range(0, 100)
	button_one_omega = randf_range(1,50)
	button_two_omega = randf_range(1,50)
	button_three_omega = randf_range(1,50)
	button_four_omega = randf_range(1,50)
	
func _modulate_colors() -> void:
	button_one.modulate = button_color_one
	button_two.modulate = button_color_two
	button_three.modulate = button_color_three
	button_four.modulate = button_color_four
	
	var button_select := randi_range(1,4)
	_button_changed(button_select)
	
func _button_changed(button_num: int) -> void:
	match button_num:
		1:
			real_line.default_color = button_color_one
			omega = button_one_omega
		2:
			real_line.default_color = button_color_two
			omega = button_two_omega
		3:
			real_line.default_color = button_color_three
			omega = button_three_omega
		4:
			real_line.default_color = button_color_four
			omega = button_four_omega
	
	if ready_done:
		_adjust_line(0)
		
func _set_line() -> void:
	var amp_1 := randf_range(0,10)
	var amp_2 := randf_range(0,10)
	var amp_3 := randf_range(0,10)
	var amp_4 := randf_range(0,10)
	
	var rand_omega: float
	var button_select := randi_range(1,4)
	match button_select:
		1:
			rand_omega = button_one_omega
		2:
			rand_omega = button_two_omega
		3:
			rand_omega = button_three_omega
		4:
			rand_omega = button_four_omega
			
	for t in range(line_segments):
		var line_value = (amp_1 * sin((rand_omega*VAR1) * t/10)) + (amp_2 * sin((rand_omega*VAR2) * t/10)) + (amp_3 * sin((rand_omega*VAR3) * t/10)) + (amp_4 * sin((rand_omega*VAR4) * t/10))
		var segment_length = LINE_LENGTH / line_segments
		imaginary_line.points[t] = Vector2(segment_length*t + 18, line_value + 100)

func _adjust_line(_value: float) -> void:
	var amp_1 = slider_one.value/10
	var amp_2 = slider_two.value/10
	var amp_3 = slider_three.value/10
	var amp_4 = slider_four.value/10
	
	for t in range(line_segments):
		var line_value = (amp_1 * sin((omega*VAR1) * t/10)) + (amp_2 * sin((omega*VAR2) * t/10)) + (amp_3 * sin((omega*VAR3) * t/10)) + (amp_4 * sin((omega*VAR4) * t/10))
		var segment_length = LINE_LENGTH / line_segments
		real_line.points[t] = Vector2(segment_length*t + 18, line_value + 100)

func _pitch_change(_value: float) -> void:
	pass
	#var pitch = value / 20
	#pitch = clampf(pitch, 0.1, 4.0)
	#current_song.pitch_scale = pitch
