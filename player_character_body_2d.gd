extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const DASH_VELOCITY = 40

@onready var start_pos = self.position

var _dash_vector : Vector2 = Vector2(0,0)

var jump_available_count = 2

func _ready() -> void:
	pass

func is_dashing():
	if _dash_vector.length_squared() > 3:
		return true
	_dash_vector = Vector2(0,0)
	return false

func dash(dir : Vector2):
	_dash_vector += dir * DASH_VELOCITY

func dash_process():
	if is_dashing():
		velocity += _dash_vector
		_dash_vector *= 0.4
	pass
	
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
	
	if is_dashing():
		dash_process()

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right") + Input.get_axis("move_left", "move_right")

	var dash_input = Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("dash")

	if direction and dash_input:
		velocity.x = direction * SPEED
		velocity.y = 0
		dash(velocity.normalized() * DASH_VELOCITY)

	
	if direction and not is_dashing():
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimationPlayer.play("walk")
	else:
		if is_on_floor():
			$AnimationPlayer.play("RESET")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if is_on_floor():
		jump_available_count = 2

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
