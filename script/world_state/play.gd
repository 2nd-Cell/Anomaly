extends state
class_name play

@export var next_state : state
@onready var start = preload("res://scene/chapter/prologue.tscn")

func enter():
	Global.scene_name = "res://scene/chapter/prologue.tscn"
	var loading_screen = load("res://scene/screen/loading_screen.tscn") # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)
	
	pass
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	print("play")
	#start.instantiate()
	if Input.is_action_just_pressed("menu"):
		transitioned.emit(self, next_state)
