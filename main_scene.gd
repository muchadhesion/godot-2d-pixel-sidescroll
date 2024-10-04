extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# content scale factor
	# get_window().content_scale_factor = 1.0
	# main window content scales with the draggable window size
	# get_window().content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	
	# set a larger default window
	get_window().size *= 2
	
	# set the the 2d sprites to render with sharp pixels
	# better to set this in the project.godot to make change visibile in editor
	# texture_filter = TEXTURE_FILTER_NEAREST
	
	# double the default gravity
	# or change this in project settings
	#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	#PhysicsServer2D.area_set_param(
	#	get_viewport().find_world_2d().space, 
	#	PhysicsServer2D.AREA_PARAM_GRAVITY, gravity * 2)

	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	delta = delta
	pass
