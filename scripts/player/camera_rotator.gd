extends Node3D

@onready var camera_arm: SpringArm3D = $CamArm

func rotate_camera(event: InputEvent) -> void:
	if event is InputEventMouseMotion and !GInit.mouse_free:
		rotate_y(deg_to_rad(-event.relative.x * GStat.mouse_sensitivity))
		camera_arm.rotate_x(deg_to_rad(-event.relative.y * GStat.mouse_sensitivity))
		camera_arm.rotation_degrees.x = clamp(camera_arm.rotation_degrees.x, -90, 45)
