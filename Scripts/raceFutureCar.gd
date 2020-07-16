extends VehicleBody

export var strength : float = 0
export var brakes = 0
export var steer = 0
export var MAX_VELOCITY = 320
# Brakes in ranges of 0.5 to 1
export var STOPPING_POWER = 0.5

# warning-ignore:unused_argument
func _physics_process(delta):
	# period character is similar to self
	get_node(".").engine_force = strength
	get_node(".").steering = steer
	get_node(".").brake = brakes
	pass
	
	# Movement
	if Input.is_action_pressed("move_forward"):
		
		if (strength < MAX_VELOCITY):
			strength += 20
			#print(strength)
		else:
			strength = 0
			
	if Input.is_action_pressed("move_backward"): 
		brakes += 0.5
		#print('break')
	else: 
		brakes = 0
		
	if Input.is_action_pressed("move_left"):
		steer = 45
		#print('left')
	elif Input.is_action_pressed("move_right"):
		steer = -45
		#print('right')
	else:
		steer = 0

# Is similar to _physics_process
	#func _input(event):
