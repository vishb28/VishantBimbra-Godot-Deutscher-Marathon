extends CharacterBody2D
class_name PlayerController 

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var direction = 0

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY


	if is_on_floor():
		if Input.is_action_pressed("ui_left"):
			velocity.x = -SPEED
		elif Input.is_action_pressed("ui_right"):
			velocity.x = SPEED
		else:
			velocity.x = 0
		if velocity.x:
			$PlayerAnimator/Sprite2D.scale.x = -1 if velocity.x < 0 else 1

	move_and_slide()
