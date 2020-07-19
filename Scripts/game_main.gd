extends Node

var right_click = false
var decreament = 0

# If zoom(fov) value is higher than 179 and less than 1 throws error
# Max and min values are set for convenience
const MAX_ZOOM = 110
const MIN_ZOOM = 40
onready var camera = get_tree().get_nodes_in_group("camera_reference")[0].get_node("camera")


func _input(event):
	if(event is InputEventMouseButton):
		if event.pressed:
			match event.button_index:
				BUTTON_WHEEL_UP:
					if(camera.fov > MIN_ZOOM):
						camera.fov -= 5
				BUTTON_WHEEL_DOWN:
					if(camera.fov < MAX_ZOOM):
						camera.fov += 5
		if(event.button_index == BUTTON_RIGHT):
			if(event.pressed):
				right_click = true
			else:
				right_click = false
				
				
	if(right_click && event is InputEventMouseMotion):
		# We access to camera reference to move it
		decreament = 1
		# Reference is an array. We access the first one
		# Rotate is a camera property
		# negative decre to rotate in y axis
		# If we want to move two axis to the same time we have to use Quaternion
		get_tree().get_nodes_in_group("camera_reference")[0].rotate(Vector3(0, - decreament, 0), event.speed.x / 1000)
		# Avoid to rotate z axis
		get_tree().get_nodes_in_group("camera_reference")[0].rotation_degrees.z = 0
	elif(right_click == false && decreament > 0):
		get_tree().get_nodes_in_group("camera_reference")[0].rotation_degrees.y = 180
	elif(right_click == false && decreament < 0):
		get_tree().get_nodes_in_group("camera_reference")[0].rotation_degrees.y = 180
