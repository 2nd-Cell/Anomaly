extends Node2D

@export var buff: buff

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	area.add_buff(buff)
	queue_free()
