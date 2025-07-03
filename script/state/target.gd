extends state
class_name target

@export var next_state : state

func enter():
	pass
	
func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	$AnimationPlayer.play("targetting")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "targetting":
		transitioned.emit(self, next_state)
