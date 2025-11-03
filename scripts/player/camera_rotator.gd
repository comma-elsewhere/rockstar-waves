class_name CamControl extends Node3D

const ARM_NORMAL := 3.0
const ARM_CLOSE := 0.5
const OFFSET_NONE := Vector3(0.0, 1.5, 0.0)
const OFFSET_SHOULDER := Vector3(1.0, 2.0, 0.0)

@onready var camera_arm: SpringArm3D = $CamArm
@onready var camera: Camera3D = $CamArm/Camera

var shoulder_view: bool = false


func rotate_camera(event: InputEvent) -> void:
	if event is InputEventMouseMotion and !GInit.mouse_free:
		rotate_y(deg_to_rad(-event.relative.x * GStat.mouse_sensitivity))
		camera_arm.rotate_x(deg_to_rad(-event.relative.y * GStat.mouse_sensitivity))
		camera_arm.rotation_degrees.x = clamp(camera_arm.rotation_degrees.x, -90, 45)
		if shoulder_view:
			rotation_degrees.y = clamp(rotation_degrees.y, -25, 30)

func reset_camera():
	camera_arm.spring_length = ARM_NORMAL
	position = OFFSET_NONE
	shoulder_view = false
	
func over_shoulder():
	camera_arm.spring_length = ARM_CLOSE
	position = OFFSET_SHOULDER
	shoulder_view = true
	
