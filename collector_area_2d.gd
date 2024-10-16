extends Area2D

var weapon = null
var coins = 0

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("collectable"):
		area.queue_free()

		var w = area.get_meta("weapon", null)
		if w:
			weapon = w
		coins += area.get_meta("coins", 0)
