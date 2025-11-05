extends Node

func my_sin(x : float):
	return sin(x/(2*PI))

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

var wave_functions = {
	"sin" : my_sin,
	"square" : square,
	"sawtooth" : sawtooth,
	"triangle" : triangle,
}

func generate_wave(segments, A, funcs, w):
	for i in range(len(segments)):
		var t = i / len(segments)
		var y = 0
		for j in range(num_waves):
			y += A[j] * wave_functions[funcs[j]].call(w[j] * t)
		segments[i].y = y * x_scale
		segments[i].x = t * y_scale
