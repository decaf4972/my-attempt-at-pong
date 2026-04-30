extends Area2D
func _on_area_entered(area: Area2D) -> void:
	if area.position.x < 0:
		Score.escore += 1
		$SoundLoss.play(0.0)
		if Score.escore >= 10:
			get_tree().change_scene_to_file('res://screens/loser.tscn')
	else:
		Score.pscore += 1
		Score.difficulty += 0.1
		$SoundWin.play(0.0)
		special_screens(Score.pscore)
	area.velocity = Vector2.ZERO
	area.position = Vector2(384.0, 304.0)
	#await get_tree().create_timer(0.5).timeout
	area.still = true
	area.is_old = false


func special_screens(points):
	if points == 3:
		get_tree().change_scene_to_file('res://screens/intermission1.tscn')
	elif points == 6:
		get_tree().change_scene_to_file('res://screens/intermission2.tscn')
	elif points == 9:
		get_tree().change_scene_to_file('res://screens/intermission3.tscn')
	elif points == 10:
		if Score.escore > 0:
			get_tree().change_scene_to_file('res://screens/winner.tscn')
		else:
			get_tree().change_scene_to_file('res://screens/secret.tscn')
