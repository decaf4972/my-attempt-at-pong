extends CharacterBody2D


const SPEED = 300.0
const SPRINT_MULTIPLYER = 2.5

var direction
var sprinting

func _physics_process(delta: float) -> void:
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_up", "ui_down")
	sprinting = Input.is_key_label_pressed(KEY_SHIFT)
	if direction:
		velocity.y = direction * SPEED
		if sprinting:
			velocity.y *= SPRINT_MULTIPLYER
	else:
		velocity.y = 0.0

	move_and_slide()
