extends AnimationPlayer

const MINUTES_PER_DAY: float = 1440
const MINUTES_PER_HOUR: float = 60
const INGAME_TO_REAL_MINUTE_DURATION: float = (2 * PI) / MINUTES_PER_DAY

@export var INGAME_SPEED := 1.0
@export var INITIAL_HOUR := 5.0:
	set(h):
		INITIAL_HOUR = h
		time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR


var time:float= 0.0
var past_minute:int= -1


func _ready() -> void:
	time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR


func _process(delta: float) -> void:
	var delta_mod = delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
	time += delta_mod
	advance(delta_mod / 2.5)
	
	#var value: float = (sin(time - PI / 2.0) + 1.0) / 2.0
	
	_recalculate_time()	

		
func _recalculate_time() -> void:
	var total_minutes = int(time / INGAME_TO_REAL_MINUTE_DURATION)
	
	var day = int(total_minutes / MINUTES_PER_DAY)

	var current_day_minutes = total_minutes % int(MINUTES_PER_DAY)

	var hour = int(current_day_minutes / MINUTES_PER_HOUR)
	var minute = int(current_day_minutes % int(MINUTES_PER_HOUR))
	
	if past_minute != minute:
		past_minute = minute
		GInit.world_time = [day, hour, minute]
