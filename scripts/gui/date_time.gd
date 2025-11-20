extends VBoxContainer

@onready var day_label: Label = $Day
@onready var time_label: Label = $Time

func _process(_delta: float) -> void:
	day_label.text = GInit.week_days[GInit.world_time[0] % 7]
	
	var meridian: String
	if GInit.world_time[1] >= 12:
		meridian = "PM"
	else:
		meridian = "AM"
		
	var hour: int = GInit.world_time[1] % 12
	if hour == 0:
		hour = 12
		
	time_label.text = str(hour) + ":" + str(GInit.world_time[2]) + meridian
