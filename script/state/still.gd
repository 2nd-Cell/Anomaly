extends state
class_name still

var distance
@export var still_reach = 75.0

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
	
	if distance <= still_reach :
		transitioned.emit(self, next_state)
	
