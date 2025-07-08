extends Node2D

@export var initial_state: state

var current_state: state
var states: Dictionary = {}
@export var default_knockback_multiplier := 1.0
var knockback_multiplier := default_knockback_multiplier

func _ready() -> void:
	
	for child in get_children():
		if child is state:
			states[child.name] = child
			child.transitioned.connect(on_child_transition)
			child.is_immune.connect(on_immunity_request)
			child.change_knockback_multiplier.connect(on_knockback_request)
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state	

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
	
	knockback_multiplier = default_knockback_multiplier
	new_state.enter()
	
	current_state = new_state

func on_knockback_request(multiplier: float):
	knockback_multiplier = multiplier

func on_immunity_request():
	knockback_multiplier = 0
