extends PanelContainer


@onready var tutorial_task_1: Label = $MarginContainer/VBoxContainer/TutorialTask1
@onready var tutorial_task_2: Label = $MarginContainer/VBoxContainer/TutorialTask2
@onready var tutorial_task_3: Label = $MarginContainer/VBoxContainer/TutorialTask3
@onready var tutorial_task_4: Label = $MarginContainer/VBoxContainer/TutorialTask4
@onready var tutorial_task_5: Label = $MarginContainer/VBoxContainer/TutorialTask5
@onready var tutorial_task_6: Label = $MarginContainer/VBoxContainer/TutorialTask6

const TASK1 := "Talk to Mom about life"
const TASK2 := "Talk to Dad about rent"
const TASK3 := "Get new lyrics - J to open Journal"
const TASK4 := "Make a new song on computer"
const TASK5 := "Find a somwhere to make money"
const TASK6 := "Buy something caffeinated"

var task_list: Array[Label]

func _ready() -> void:
	if GInit.tutorial:
		_setup()
		visible = true
		GFunc.task_finished.connect(update_visible)
		
		
func _setup() -> void:
	tutorial_task_1.text = TASK1
	tutorial_task_2.text = TASK2
	tutorial_task_3.text = TASK3
	tutorial_task_4.text = TASK4
	tutorial_task_5.text = TASK5
	tutorial_task_6.text = TASK6
	
	task_list = [tutorial_task_1, tutorial_task_2, tutorial_task_3, tutorial_task_4, tutorial_task_5, tutorial_task_6]
	update_visible()
	
func update_visible() -> void:
	if GInit.tutorial == false:
		_finish_tutorial()
	else:
		for i in len(task_list):
			if GInit.tutorial_tasks[i] != 0:
				task_list[i].visible = false

func _finish_tutorial() -> void:
	visible = false
	Clock.minute_changed.disconnect(update_visible)
