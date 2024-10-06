extends Node

const DASH_SPEED = 800
const DASH_FRAMES = 10

@onready var player = get_parent()

var dash_frame_count = 0
var dash_direction = 0

func start_dash(direction):
	player.velocity.y = 0
	dash_direction = direction
	dash_frame_count = DASH_FRAMES

func is_dashing():
	return dash_frame_count > 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func dash_physics_process(_delta: float) -> void:

	var dash_input = Input.is_action_just_pressed("dash")
	var direction := Input.get_axis("ui_left", "ui_right") + Input.get_axis("move_left", "move_right")

	if direction and dash_input and not is_dashing():
		start_dash( direction )

	if is_dashing():
		player.velocity.y = 0
		player.velocity.x = DASH_SPEED * direction
		dash_frame_count -= 1

	pass
