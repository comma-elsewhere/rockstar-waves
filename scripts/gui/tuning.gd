extends MarginContainer

signal puzzle_is_solved

@export var current_song: AudioStreamPlayer
@export var real_line: Line2D
@export var imaginary_line: Line2D
@export var play_button: Button
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
const X_SCALE: float = 560
const Y_SCALE: float = 10

enum Waves {SIN, SQAURE, TRIANGLE, SAWTOOTH}

var omega_1: float
var omega_2: float
var omega_3: float
var omega_4: float

var line_segments: int = 50
var selected_wave
var wave_array: Array[String]

var ready_done: bool = false
var puzzle_solved: bool = false

func _ready() -> void:
	wave_array = ["my_sin", "square", "triangle", "sawtooth"]
	_set_values()
	_set_line()
	_modulate_colors()
	_adjust_line(0)
	play_button.disabled = true
	
	slider_one.value_changed.connect(_adjust_line)
	slider_two.value_changed.connect(_adjust_line)
	slider_three.value_changed.connect(_adjust_line)
	slider_four.value_changed.connect(_adjust_line)
	
	button_one.pressed.connect(_button_changed.bind(1))
	button_two.pressed.connect(_button_changed.bind(2))
	button_three.pressed.connect(_button_changed.bind(3))
	button_four.pressed.connect(_button_changed.bind(4))
	
	ready_done = true
	
func _process(_delta: float) -> void:
	var distance_accuracy: float = 0
	var target_accuracy: float = 200
	if !puzzle_solved:
		for i in range(line_segments):
			distance_accuracy += (imaginary_line.points[i].y - real_line.points[i].y)**2
		if distance_accuracy < target_accuracy:
			puzzle_solved = true
	else:
		puzzle_is_solved.emit()
		_disable_enable_buttons()
		
	
	
func _set_values() -> void:
	randomize()
	slider_one.value = randf_range(0, 100)
	slider_two.value = randf_range(0, 100)
	slider_three.value = randf_range(0, 100)
	slider_four.value = randf_range(0, 100)
	omega_1 = randf_range(1,5)
	omega_2 = randf_range(1,5)
	omega_3 = randf_range(1,5)
	omega_4 = randf_range(1,5)
	
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
			selected_wave = Waves.SIN
		2:
			real_line.default_color = button_color_two
			selected_wave = Waves.SQAURE
		3:
			real_line.default_color = button_color_three
			selected_wave = Waves.TRIANGLE
		4:
			real_line.default_color = button_color_four
			selected_wave = Waves.SAWTOOTH
	
	if ready_done:
		_adjust_line(0)
		
func _set_line() -> void:
	randomize()
	var amp_1 := randf_range(0,1)
	var amp_2 := randf_range(0,1)
	var amp_3 := randf_range(0,1)
	var amp_4 := randf_range(0,1)
	
	for i in line_segments:
		real_line.add_point(Vector2.ZERO)
		imaginary_line.add_point(Vector2.ZERO)

	var button_select := randi_range(1,4)
	match button_select:
		1:
			selected_wave = Waves.SIN
		2:
			selected_wave = Waves.SQAURE
		3:
			selected_wave = Waves.TRIANGLE
		4:
			selected_wave = Waves.SAWTOOTH
			
	_line_equation(amp_1, amp_2, amp_3, amp_4, false)

func _adjust_line(_value: float) -> void:
	var amp_1 = slider_one.value/100
	var amp_2 = slider_two.value/100
	var amp_3 = slider_three.value/100
	var amp_4 = slider_four.value/100
	
	_line_equation(amp_1, amp_2, amp_3, amp_4, true)

func _line_equation(amp1: float, amp2: float, amp3: float, amp4: float, is_line_real: bool):
	for i:float in range(line_segments):
		var t = i / line_segments
		var line_height = (amp1 * call(wave_array[selected_wave], (omega_1 * t))) + (amp2 * call(wave_array[selected_wave], (omega_2 * t))) + (amp3 * call(wave_array[selected_wave], (omega_3 * t))) + (amp4 * call(wave_array[selected_wave], (omega_4 * t)))
		if is_line_real:
			real_line.points[i].y = line_height * Y_SCALE + 100
			real_line.points[i].x = t * X_SCALE + 18
		else:
			imaginary_line.points[i].y = line_height * Y_SCALE + 100
			imaginary_line.points[i].x = t * X_SCALE + 18
		
func _disable_enable_buttons() -> void:
	play_button.disabled = false
	
		
func my_sin(x : float):
	return sin(x*2*PI)

func square(x : float):
	if fmod(x, 1.0) < 0.5:
		return 1
	else:
		return -1

func sawtooth(x : float):
	return 1-fmod(x, 1)*2

func triangle(x : float):
	var a = fmod(x, 1) + .25
	if a < 0.5:
		return -1 + a * 4
	else:
		return 3 - a * 4
