extends KinematicBody2D

const speed = 300
const gravity = 17
const jp = -450
const fl = Vector2(0,-1)
const Bump_Velocity = -1000

var velocity = Vector2()

var on_ground = false


func _physics_process(delta: float):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$AnimatedSprite.play("Run")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Run")
		velocity.x = -speed
	
	else:
		velocity.x = 0
		if on_ground == true:
			$AnimatedSprite.play("Idle")
	
	if Input.is_action_pressed("jump"):
		if on_ground == true:
			velocity.y = jp
			on_ground = true
			$AnimatedSprite.play("Jump")
		
	velocity.y += gravity
	
	if is_on_floor():
		on_ground = true
		
	else:
		on_ground = false
		if velocity.y < 0:
			$AnimatedSprite.play("Jump")
		else:
			$AnimatedSprite.play("Fall")
	
# warning-ignore:return_value_discarded
	velocity = move_and_slide(velocity, fl)


func _on_Bumper_body_entered(body: Node) -> void:
	velocity.y = Bump_Velocity
