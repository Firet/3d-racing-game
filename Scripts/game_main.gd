extends Node

var right_click = false
var decreament = 0

func _input(event):
	#print('event')
	if(event is InputEventMouseButton):
		# Access to mouse button
		if(event.button_index == BUTTON_RIGHT):
			#print('event.button == button right')
			if(event.pressed):
				right_click = true
				#print('right click pressed')
			else:
				right_click = false
				#print('right click released')
				
	if(right_click && event is InputEventMouseMotion):
		print('right_click and event mouse motion')
	# We access to camera reference to move it
		decreament = 1
		# Reference is an array. We access the first one
		# Rotate is a camera property
		# negative decre to rotate in y axis
		# If we want to move two axis to the same time we have to use Quaternion
		get_tree().get_nodes_in_group("reference")[0].rotate(Vector3(0, - decreament, 0), event.speed.x / 1000)
		# Avoid to rotate z axis
		#get_tree().get_node_in_group("reference")[0].rotation_degrees.z = 0
	elif(right_click == false && decreament > 0):
		get_tree().get_nodes_in_group("reference")[0].rotation_degrees.y = 0
	elif(right_click == false && decreament < 0):
		get_tree().get_nodes_in_group("reference")[0].rotation_degrees.y = 0
