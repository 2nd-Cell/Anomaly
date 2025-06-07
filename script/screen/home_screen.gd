extends Control

func _on_start_pressed() -> void:
	
	Global.scene_name = "res://scene/chapter/prologue.tscn" 
	
	var loading_screen = load("res://scene/screen/loading_screen.tscn") # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)
