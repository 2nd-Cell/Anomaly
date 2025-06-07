extends Node
var scene_name
var player_position: Vector2
var time

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Switch_Screen(scene: String):
	var loading_screen = load(scene_name) # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)
