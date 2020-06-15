extends KinematicBody2D

const speed = 300
const gravity = 17
const jp = -450
const fl = Vector2(0,-1)
const Bump_Velocity = -1000

var velocity = Vector2()

func _ready() -> void:
	velocity.x = -speed
	
	
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	if is_on_wall():
		velocity.x *= -1
	velocity.y = move_and_slide(velocity, fl).y
