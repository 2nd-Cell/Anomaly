extends Node2D

@export var initial_state: state

var current_state: state
var states: Dictionary = {}


func _ready() -> void:
	
	for child in get_children():
		if child is state:
			states[child.name] = child
			child.transitioned.connect(on_child_transition)
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state	
		print(current_state)

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func on_child_transition(state, new_state):
	
	if state!=current_state:
		return
		
	if !new_state:
		return
		
	if current_state:
		current_state.exit()
		
	new_state.enter()
	
	current_state = new_state
