extends Area2D

var velocity = Vector2.ZERO
var still = true


func mover(place, delta):
	place += velocity*delta
	return place
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if still and Input.is_anything_pressed():
		still = false
		velocity = Vector2(400.0, 400.0)
	position = mover(position, delta)


func _on_body_entered(body: Node2D):
	if body.is_in_group('walls'):
		velocity.y *= -1
	elif body.is_in_group('paddles'):
		var relative = position.y - body.position.y - 64
		velocity.y = relative*8.0
		if velocity.x < 1100.0:
			velocity.x *= -1.1
