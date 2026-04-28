extends CharacterBody2D


const SPEED = 300.0
const SPRINT_MULTIPLYER = 2.5

var direction
var sprinting

func _process(delta: float):
	direction = Input.get_axis("ui_up", "ui_down")
	sprinting = Input.is_key_label_pressed(KEY_SHIFT)
	if direction and sprinting:
		velocity.y = SPEED*delta*2.5*direction
	elif direction:
		velocity.y = SPEED*delta*direction
	else:
		velocity.y = 0
	move_and_collide(velocity)
