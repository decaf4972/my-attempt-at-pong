extends RigidBody2D

var wall = false
var paddle = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	set_contact_monitor(true)
	set_max_contacts_reported(4)

func _process(delta: float) -> void:
	#if wall:
		#print(wall)
		#wall = false
		#var velocity := get_linear_velocity()
		#print(velocity)
		#velocity.y *= -1
		#print(velocity)
		#set_linear_velocity(velocity)
	print(linear_velocity)

func _on_body_entered(body: Node) -> void:
	print('body entered')
	if len(get_colliding_bodies()) > 2:
		print('doubble hit detected')
		wall = true
		paddle = true
		return
	elif body is StaticBody2D:
		print('wall detected')
		wall = true
		return
	else:
		print('paddle detected')
		paddle = true
		return
	print('this should not run')
