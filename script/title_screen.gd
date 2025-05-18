extends Control

var fade = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fade == true:
		$fading.play("fading")
	else:
		$fading.play("fading (short)")

func _on_touch_pressed() -> void:
	fade = false
	Global.scene_name = "res://scene/home_screen.tscn" 
	await get_tree().create_timer(0.5).timeout
	
	var loading_screen = load("res://scene/loading_screen.tscn") # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)
