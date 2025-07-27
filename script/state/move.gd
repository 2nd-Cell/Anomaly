extends psm
class_name move

var buff = true

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
	
	if Input.is_action_just_pressed("pause"):
		transitioned.emit(self, next_state)
	
	if buff:
		SPEED = $"../..".stats.speed
	
	var direction = Input.get_vector("left", "right", "up", "down")
	Global.player_position = $"../..".position
	
	var spd = (SPEED + $"../../buff_machine".calc_buff("SPEED"))
	print(spd)
	$"../..".velocity = direction * spd
#
	$"../..".move_and_slide()
	
	
