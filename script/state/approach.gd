extends state
class_name approach

@export var speed := 50.0
@onready var player: Node2D = $"../player"
@onready var nav_agent: NavigationAgent2D = $"../../NavigationAgent2D"

@export var reach := 100
var distance

func _ready() -> void:
	pass

func enter():
	distance = Global.player_position.distance_to(owner.global_position)

func exit():
	pass

func update(delta: float):
	pass
	
func physics_update(delta: float, velocity:Vector2):
	
	distance = Global.player_position.distance_to(owner.global_position)
	
	var dir : Vector2
	
	if distance <= reach:
		velocity = Vector2(0,0)
		dir = Vector2(0,0)
		#transitioned.emit(self, "target")
		print("Within reach - stopping")
		
	else:
		dir = owner.to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * speed
		make_path(Global.player_position)
		print("Approaching player")
	
	print(velocity, " ||  ",distance, " || ",reach )
	return velocity

func make_path(pos: Vector2) -> void:
	nav_agent.target_position = pos
