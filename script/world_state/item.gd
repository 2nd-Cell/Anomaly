extends state
class_name item

@export var next_state : state

func enter():
	pass

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):

	if Input.is_action_just_pressed("pause"):
		transitioned.emit(self, next_state)
