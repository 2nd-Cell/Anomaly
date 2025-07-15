extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.get_parent())
	area.get_parent().add_buff("SPEED", "ABS", 150.0, 5.0)
	queue_free()
