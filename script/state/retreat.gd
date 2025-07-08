extends state
class_name retreat

var distance

@export var retreating_reach = 80.0
@export var retreating_speed := 80.0
@export var next_state : state

func _ready() -> void:
	pass

func enter():
	distance = Global.player_position.distance_to(owner.global_position)

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	distance = Global.player_position.distance_to(owner.global_position)
	var dir = $"../../..".global_position.direction_to(Global.player_position)
	
	var velocity = Vector2(0,0)
	
	if distance >= retreating_reach:
		transitioned.emit(self, next_state)
	else:
		velocity = -dir * retreating_speed
	$"../../..".velocity = velocity
	$"../../..".move_and_slide()
