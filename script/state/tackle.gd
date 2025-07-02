extends state
class_name tackle

@onready var nav_agent: NavigationAgent2D = $"../../NavigationAgent2D"

@onready var approach_state = $"../approach"

var target_position
var start_position
const reach = 100
const speed = 100

func enter():
	#target_position = owner.to_local(nav_agent.get_next_path_position()).normalized()*reach
	target_position = (Global.player_position-$"../..".global_position).normalized()*reach
	start_position = $"../..".global_position
	
	print(target_position, " || ", "target position" )
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	
	var dir = $"../..".global_position.direction_to(target_position)
	#print((($"../..".global_position) - (target_position)).length(), " || snatcher position")
	#if (abs(target_position - $"../..".global_position) + abs($"../..".global_position - start_position)) >= abs(target_position - start_position):
		#dir = Vector2.ZERO
		#transitioned.emit(self, approach_state)
	
	$"../..".velocity = dir*speed
	$"../..".move_and_slide()
