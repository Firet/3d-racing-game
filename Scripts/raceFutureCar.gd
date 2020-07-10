extends VehicleBody

export var fuerza : float = 0
export var frenos = 0
export var giro = 0

# warning-ignore:unused_argument
func _physics_process(delta):
	# period character is similar to self
	get_node(".").engine_force = fuerza
	get_node(".").steering = giro
	get_node(".").brake = frenos
	pass
	
	# Movimientos
	if Input.is_action_pressed("move_forward"):
		
		# 120 is magic number. max velocity 
		if (fuerza < 120):
			fuerza += 20
			print(fuerza)
		else:
			fuerza = 0
			
	if Input.is_action_pressed("move_backward"):
		# 0.5 is magic number, increase to 1 in 0.5 
		frenos += 0.5
		print('break')
	else: 
		frenos = 0
		
	if Input.is_action_pressed("move_left"):
		giro = 45
		print('left')
	elif Input.is_action_pressed("move_right"):
		giro = -45
		print('right')
	else:
		giro = 0

# is similar to phtsic process
	#func _input(event):
