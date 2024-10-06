extends Node

const DASH_VELOCITY = 40

@onready var player = get_parent()

var _dash_vector : Vector2 = Vector2(0,0)

func dash_process():
	if is_dashing():
		player.velocity += _dash_vector
		_dash_vector *= 0.4
	pass

func dash(dir : Vector2):
	_dash_vector += dir * DASH_VELOCITY
	
func is_dashing():
	if _dash_vector.length_squared() > 3:
		return true
	_dash_vector = Vector2(0,0)
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:

	var dash_input = Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("dash")
	var direction := Input.get_axis("ui_left", "ui_right") + Input.get_axis("move_left", "move_right")

	if direction and dash_input:
		player.velocity.y = 0
		dash( player.velocity.normalized() * DASH_VELOCITY )

	if is_dashing():
		dash_process()

	pass
