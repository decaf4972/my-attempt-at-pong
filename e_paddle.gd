extends RigidBody2D

const LOW_SPEED = 200.0
const MID_SPEED = 400.0
const HIGH_SPEED = 600.0

var ticks = 0.0
var ball = null
var target = null
var timer = null
var paddle_position = null
var speed = LOW_SPEED

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ball = get_parent().find_child('Ball')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ticks += delta
	if not timer:
		timer = 0.0
	timer += ticks
	if timer >= 180.0:
		speed = [LOW_SPEED, MID_SPEED, HIGH_SPEED][randi_range(0, 2)]
		timer = null
	print(timer)
	
	if not paddle_position:
		paddle_position = randf_range(0.0, 128.0)
	
	target = ball.position.y - paddle_position
	position.y = move_toward(position.y, target, speed * delta )
	
	if ball.velocity.x < 0:
		paddle_position = null
	
	move_and_collide(Vector2.ZERO)
