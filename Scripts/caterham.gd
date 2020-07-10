extends VehicleBody

export var MAX_ENGINE_FORCE = 200.0
export var MAX_BRAKE_FORCE = 5.0
export var MAX_STEER_ANGLE = 0.5

export var steer_speed = 5.0

var steer_target = 0.0
var steer_angle = 0.0

export var steering_mult = -1.0
export var throttle_mult = 1.0
export var brake_mult = 1.0


func _physics_process(delta):
	var steer_val = 0
	var throttle_val = 0
	var brake_val = 0

	if Input.is_action_pressed("move_forward"):
		throttle_val = 1.0
	if Input.is_action_pressed("move_backward"):
		throttle_val = -1.0
	if Input.is_action_pressed("brake"):
		brake_val = 1.0
	if Input.is_action_pressed("move_left"):
		steer_val = 1.0
	elif Input.is_action_pressed("move_right"):
		steer_val = -1.0
	
	engine_force = throttle_val * MAX_ENGINE_FORCE
	brake = brake_val * MAX_BRAKE_FORCE
	
	steer_target = steer_val * MAX_STEER_ANGLE
	if (steer_target < steer_angle):
		steer_angle -= steer_speed * delta
		if (steer_target > steer_angle):
			steer_angle = steer_target
	elif (steer_target > steer_angle):
		steer_angle += steer_speed * delta
		if (steer_target < steer_angle):
			steer_angle = steer_target
	
	steering = steer_angle
