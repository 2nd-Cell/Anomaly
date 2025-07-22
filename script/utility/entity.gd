extends Node2D

@export var res: item_resource

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("in_pickup_range"):
		area.in_pickup_range(res)
	queue_free()
