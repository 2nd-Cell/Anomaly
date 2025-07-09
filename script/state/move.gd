extends psm
class_name move

@export var next_state : state

@onready var AnimPlayer: = $"../../AnimatedSprite2D"

@export var SPEED = 150.0

func enter():
	super()
	Global.player_position = $"../..".position
	
func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	var direction = Input.get_vector("left", "right", "up", "down")
	Global.player_position = $"../..".position
	$"../..".velocity = direction * SPEED
#
	$"../..".move_and_slide()
