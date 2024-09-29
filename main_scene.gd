extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# content scale factor
	get_window().content_scale_factor = 1.0
	# main window content scales with the draggable window size
	get_window().content_scale_mode = Window.CONTENT_SCALE_MODE_CANVAS_ITEMS
	
	# set a larger default window
	get_window().size *= 2
	
	# set the the 2d sprites to render with sharp pixels
	texture_filter = TEXTURE_FILTER_NEAREST
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
