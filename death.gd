extends Area2D
func _on_area_entered(area: Area2D) -> void:
	if area.position.x < 0:
		Score.escore += 1
	else:
		Score.pscore += 1
	area.velocity = Vector2.ZERO
	area.position = Vector2(384.0, 304.0)
	await get_tree().create_timer(0.5).timeout
	area.still = true
