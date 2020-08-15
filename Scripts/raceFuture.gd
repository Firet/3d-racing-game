extends VehicleBody

# This is the direction velocity
const VEL_DIREC = 1
# Custom number
const LIMIT_DIREC = 0.4

# The direction where we going to face when steer
var direc_target = 0
# Forward velocity.Its like speedmeter 
var fwd_vel = 0

export var engine_force_value = 280
# Warning, brake value range is from 0 to 1, but 5 works. Check documentation
export var brake_force_value = 5
export var max_vel = 200
export var max_back_vel = 150

func _ready():
	# This is to avoid see the mouse cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

# Need to try if works better with physics process
# Recommendation: when only use input, not use process
# Similar to update in unity
func _process(delta):
	show_speed_meter_in_hud()
	move_car(delta)

# warning-ignore:unused_argument
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
func show_speed_meter_in_hud():
		if fwd_vel > 0:
			get_tree().get_nodes_in_group("velocity")[0].text = String(fwd_vel) + " Km/h"
		else:
			get_tree().get_nodes_in_group("velocity")[0].text = "0 Km/h"


func move_car(delta):
	# Linear velocity x axis. basis related to matrix
	# matrix is like the origin point
	# X form its the multiplication of all (three) x values in matrix 
	fwd_vel = transform.basis.xform_inv(linear_velocity).x
	# Stepify is to avoid large amount of decimals
	# Can be mutiplied for any number. here 3.6
	# 0.1 just want a decimal. 
	fwd_vel = stepify(fwd_vel * 3.6, 0.1) 
	
	# If we want to turn left is +1, to turn right is -1
	direc_target = Input.get_action_strength("move_left") - Input.get_action_strength("move_right")
	direc_target *= LIMIT_DIREC
	
	if Input.is_action_pressed("move_forward"):
		if fwd_vel < max_vel:
			engine_force = engine_force_value
		else:
			engine_force = 0.0
		# Another condition, related to simulate. But we want more arcade driving
		# This is for torque
		# fwd_vel < -1
	else: 
		# This is good practice, just in case that throws error
		engine_force = 0.0
	
	if Input.is_action_pressed("move_backward"):
		if fwd_vel >= 1: 
			brake = brake_force_value
		# The max velocity you can go backwards
		elif fwd_vel >=  - max_back_vel:
			engine_force = - engine_force_value
		else: 
			engine_force = 0.0
	else:
		brake = 0.0
		
	# Third argumenti is delta, related to time.
	steering = move_toward(steering, direc_target, VEL_DIREC - delta)
