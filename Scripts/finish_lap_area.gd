extends Area


func _on_Area_body_entered(body):
	if body.is_in_group("player") && GameMain.currentLap < GameMain.totalLaps:
		GameMain.currentLap += 1
		get_tree().get_nodes_in_group("laps")[0].text = "Lap " + String(GameMain.currentLap) + "/" + String(GameMain.totalLaps)
		if GameMain.currentLap >= GameMain.totalLaps:
			get_tree().get_nodes_in_group("panel")[0].visible = true
		else:
			get_tree().get_nodes_in_group("panel")[0].visible = false
