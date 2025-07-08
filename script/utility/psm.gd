extends state
class_name psm
@export var initial_state: state

var current_state: state
var states: Dictionary = {}

func enter() -> void:
	
	for child in get_children():
		if child is state:
			states[child.name] = child
			child.transitioned.connect(on_child_transition)
			child.is_immune.connect(on_immunity_request)
			child.change_knockback_multiplier.connect(on_knockback_request)
	if initial_state:
		initial_state.enter()
		current_state = initial_state	

func update(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func physics_update(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(old_state, new_state):
	
	if new_state in get_children() and new_state is state:
		
		if old_state!=current_state:
			return
		
		if !new_state:
			return
		
		if current_state:
			current_state.exit()
	
		new_state.enter()
	
		current_state = new_state
		
	else:
		transitioned.emit(self, new_state)
	
func on_immunity_request():
	is_immune.emit()

func on_knockback_request(multiplier: float):
	change_knockback_multiplier.emit(multiplier)
