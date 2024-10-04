extends Camera2D
class_name CustomCamera2D

# Target node the camera is following
@export var TargetNode : Node2D = null

func _process(_delta) -> void:
	if TargetNode:
		var diff_vector = TargetNode.position - position
		position += diff_vector * 0.02
		# set_position(TargetNode.get_position())     # Change this code to make custom camera movement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
