extends state
class_name wait

@export var next_state : state

func enter():
	$Timer.start()
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	pass


func _on_timer_timeout() -> void:
	transitioned.emit(self, next_state)
