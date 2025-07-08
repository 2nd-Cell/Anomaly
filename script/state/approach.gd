extends state
class_name approach

@export var approaching_speed := 50.0
@onready var nav_agent: NavigationAgent2D = $"../../NavigationAgent2D"

@export var approaching_reach := 200
var distance

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
	
	var dir : Vector2
	var velocity := Vector2.ZERO
	
	if distance <= approaching_reach:
		transitioned.emit(self, next_state)
		
	else:
		dir = owner.to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * approaching_speed
		make_path(Global.player_position)
	
	$"../..".velocity = velocity
	$"../..".move_and_slide()

func make_path(pos: Vector2) -> void:
	nav_agent.target_position = pos
