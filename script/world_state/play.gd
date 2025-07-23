extends psm
class_name play

@export var next_state : state

func enter():
	super()

func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	if Input.is_action_just_pressed("menu"):
		transitioned.emit(self, next_state)
