extends Area


func _on_Area_body_entered(body):
	if(body.is_in_group("player")):
		GameMain.laps += 1
		print(GameMain.laps)
