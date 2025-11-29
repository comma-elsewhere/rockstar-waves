class_name CamControl extends Node3D

signal look_trigger(game_name: String)
signal look_untrigger

const ARM_CLOSE := 0.5


@export var parent: Character
@export var ARM_NORMAL := 3.5
@export var OFFSET_NONE := Vector3(0.0, 1.5, 0.0)
@export var OFFSET_SHOULDER := Vector3(1.0, 2.0, 0.0)
@onready var camera_arm: SpringArm3D = $CamArm
@onready var camera: Camera3D = $CamArm/Camera
@onready var hand: Node3D = $Hand
@onready var raycast: RayCast3D = $CamArm/Camera/AreaRayCast


var shoulder_view: bool = false

func _ready() -> void:
	camera_arm.spring_length = ARM_NORMAL

func _process(_delta: float) -> void:
	var object = raycast.get_collider()
	if raycast.is_colliding() and object.is_in_group("LookInteract"):
		look_trigger.emit(object.game_name)
	else:
		look_untrigger.emit()

func object_pickup() -> void:
	var object = raycast.get_collider()
	if raycast.is_colliding():
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			object.global_position = hand.global_position
			object.global_rotation = hand.global_rotation
			object.collision_layer = 3
			object.linear_velocity = Vector3(0.1, 3, 0)

func rotate_camera(event: InputEvent) -> void:
	if event is InputEventMouseMotion and !GInit.mouse_free:
		parent.rotate_y(deg_to_rad(-event.relative.x * GStat.mouse_sensitivity))
		rotate_x(deg_to_rad(-event.relative.y * GStat.mouse_sensitivity))
		rotation_degrees.x = clamp(rotation_degrees.x, -90, 45)

func reset_camera():
	camera_arm.spring_length = ARM_NORMAL
	position = OFFSET_NONE
	shoulder_view = false
	
func over_shoulder():
	camera_arm.spring_length = ARM_CLOSE
	position = OFFSET_SHOULDER
	shoulder_view = true
	
