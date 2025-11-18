extends Node

@onready var waypoints: Array = get_children()
@onready var pedestrians: Array = get_tree().get_nodes_in_group("Pedestrians")

const LOITER_MIN := 2.0
const LOITER_MAX := 12.0

func _ready() -> void:
	randomize()
	for person in pedestrians:
		person.waypoint_reached.connect(_on_waypoint_reached)
		person.nav_to_waypoint(waypoints.pick_random())
		

		
func _on_waypoint_reached(person: NPC_Class) -> void:
	await _loiter_at_waypoint()
	person.nav_to_waypoint(waypoints.pick_random())
	
func _loiter_at_waypoint() -> bool:
	await get_tree().create_timer(randf_range(LOITER_MIN, LOITER_MAX)).timeout
	return true
