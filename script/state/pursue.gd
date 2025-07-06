extends state
class_name pursue

@export var pursuing_speed := 50.0
@onready var nav_agent: NavigationAgent2D = $"../../NavigationAgent2D"

@export var next_state : state

func _ready() -> void:
	pass

func enter():
	pass

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float):
		
	var dir : Vector2
	dir = owner.to_local(nav_agent.get_next_path_position()).normalized()
	make_path(Global.player_position)
	
	$"../..".velocity = dir * pursuing_speed
	$"../..".move_and_slide()

func make_path(pos: Vector2) -> void:
	nav_agent.target_position = pos
