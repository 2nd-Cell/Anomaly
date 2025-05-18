extends Control

func _on_start_pressed() -> void:
	
	Global.scene_name = "res://scene/world.tscn" 
	
	var loading_screen = load("res://scene/loading_screen.tscn") # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)
