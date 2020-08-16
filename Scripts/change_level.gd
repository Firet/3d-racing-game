extends Button


func _on_ChangeLevelButton_pressed():
	# TODO: If im in level one go to two and vice versa
	change_to_second_level()
	GameMain.reset_laps_and_time()

# warning-ignore:unused_argument
func _input(delta):
	if Input.is_action_pressed("level_one"):
		change_to_first_level()
	if Input.is_action_pressed("level_two"):
		change_to_second_level()


func change_to_first_level():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/First-Level.tscn")
	GameMain.reset_laps_and_time()
		
func change_to_second_level():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Second-Level.tscn")
	GameMain.reset_laps_and_time()
