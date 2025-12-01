extends Node

signal minute_changed

const MINUTES_PER_DAY: float = 1440
const MINUTES_PER_HOUR: float = 60
const INGAME_TO_REAL_MINUTE_DURATION: float = MINUTES_PER_DAY
const INGAME_SPEED := 1.0
const INITIAL_HOUR := 6.0

var time:float= 0.0
var past_minute:int= -1
var past_hour:int= -1

var rent_collected: bool = false


func _ready() -> void:
	time = INGAME_TO_REAL_MINUTE_DURATION * MINUTES_PER_HOUR * INITIAL_HOUR


func _process(delta: float) -> void:
	time += delta * INGAME_TO_REAL_MINUTE_DURATION * INGAME_SPEED
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
		minute_changed.emit()
		_check_rent(day, hour)
		
func _check_rent(current_day: int, current_hour: int) -> void:
	if current_day % 7 == 6 and current_hour == 8:
		if !rent_collected:
			GFunc.collect_rent()
			rent_collected = true
		else:
			pass
	elif current_hour > 8 and rent_collected == true:
		rent_collected = false
