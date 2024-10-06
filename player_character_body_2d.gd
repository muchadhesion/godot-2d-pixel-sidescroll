extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var start_pos = self.position

const JUMP_COUNT_LIMIT = 2
var jump_available_count = JUMP_COUNT_LIMIT

func is_moving_fast():
	return velocity.length_squared() > 2

func can_jump():
	if is_on_floor():
		return true
	if jump_available_count > 0:
		return true
	return false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right") + Input.get_axis("move_left", "move_right")

	if direction and not is_moving_fast():
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimationPlayer.play("walk")
	else:
		if is_on_floor():
			$AnimationPlayer.play("RESET")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		jump_available_count = JUMP_COUNT_LIMIT

	# Handle jump
	var jump_input = Input.is_action_just_pressed("jump")
	if jump_input and can_jump():
		jump_available_count -= 1
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.play("jump")

	if direction < 0:
		$Sprite2D.flip_h = true
	elif direction > 0:
		$Sprite2D.flip_h = false

	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	self.position = start_pos
	self.velocity = Vector2(0,0)
	pass # Replace with function body.
