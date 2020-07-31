extends Button

# warning-ignore:unused_argument
func _physics_process(delta):
	resetByPressingResetKey()

# Reset level by clicking the UI button
func _on_Button_pressed():
	reset()

# Reset level by pressing the reset keyboard key
func resetByPressingResetKey():
	if Input.is_action_pressed("reset"):
		reset()

func reset():
	# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	GameMain.currentLap = 0
	GameMain.time = 0
