extends Area2D

var velocity = Vector2.ZERO
var still = true
var left = true
var wall = null
var is_old = false
var timer_going = false


func mover(place, delta):
	place += velocity*delta
	return place
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if still and is_old and Input.is_anything_pressed() :
		still = false
		is_old = false
		velocity = Vector2(400.0, 50.0)
	elif still and not is_old and not timer_going:
		$Timer.start(0.5)
		timer_going = true
	position = mover(position, delta)


func _on_body_entered(body: Node2D):
	if body.is_in_group('walls'):
		velocity.y *= -1
		$SoundWall.play(0.0)
	
	else:
	#elif body.is_in_group('paddles'):
		$SoundPaddle.play(0.0)
		if position.x > 500:
			left = true
		else:
			left = false
		
		velocity.y = 8.0 * (position.y - body.position.y - 64)
		
		var absx = abs(velocity.x)
		if absx < 1100.0:
			velocity.x = absx * 1.1
		else:
			velocity.x = absx
		if left:
			velocity.x *= -1
			
		var overlaps = get_overlapping_bodies()
		for thing in overlaps:
			if thing.is_in_group('walls'):
				velocity.y *= -1


func _on_timer_timeout() -> void:
	is_old = true
	timer_going = false
