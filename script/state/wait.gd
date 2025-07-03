extends state
class_name wait

@onready var approach_state = $"../approach"

func enter():
	$Timer.start()
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	pass


func _on_timer_timeout() -> void:
	transitioned.emit(self, approach_state)
