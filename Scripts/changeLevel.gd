extends Button


func _on_ChangeLevelButton_pressed():
	# TODO: If im in level one go to two and vice versa
	changeToSecondLevel()

# warning-ignore:unused_argument
func _input(delta):
	if Input.is_action_pressed("level_one"):
		changeToFirstLevel()
	if Input.is_action_pressed("level_two"):
		changeToSecondLevel()


func changeToFirstLevel():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/First-Level.tscn")
		
func changeToSecondLevel():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Second-Level.tscn")
