extends state
class_name menu_impl

@export var next_state : state

func enter():
	pass

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
	
	if Input.is_action_just_pressed("menu"):
		transitioned.emit(self, next_state)

func _on_weapon_pressed() -> void:
	transitioned.emit(self, $"../weapon")

func _on_equipment_pressed() -> void:
	transitioned.emit(self, $"../equipment")

func _on_item_pressed() -> void:
	transitioned.emit(self, $"../item")

func _on_stat_pressed() -> void:
	transitioned.emit(self, $"../stat")

func _on_option_pressed() -> void:
	transitioned.emit(self, $"../option")

func _on_exit_pressed() -> void:
	transitioned.emit(self, $"../exit")

func _on_save_pressed() -> void:
	Global.save_world()
