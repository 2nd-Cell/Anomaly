extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	var next_scene = load("res://scene/chapter/prologue.tscn")
	
	get_tree().change_scene_to_packed(next_scene)
