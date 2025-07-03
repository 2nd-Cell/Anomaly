extends state
class_name tackle

@onready var wait_state = $"../wait"

var target_position
var start_position
var distance
@export var tackle_reach = 300
@export var tackle_speed = 750
var dir : Vector2

func enter():
	target_position = ((Global.player_position-$"../..".global_position).normalized()*tackle_reach) + $"../..".global_position
	start_position = $"../..".position
	dir = $"../..".global_position.direction_to(target_position)

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	
	distance = start_position.distance_to(owner.global_position)
	
	var velocity := Vector2.ZERO
	
	if distance >= tackle_reach:
		transitioned.emit(self, wait_state)
		
	else:
		velocity = dir * tackle_speed
		
	$"../..".velocity = velocity
	$"../..".move_and_slide()
