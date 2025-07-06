#extends state
#class_name retreat
#
#@export var retreat_speed := 50.0
#
#@export var retreat_reach := 100
#var distance
#
#@export var next_state : state
#
#func _ready() -> void:
	#pass
#
#func enter():
	#distance = Global.player_position.distance_to(owner.global_position)
#
#func exit():
	#pass
#
#func update(delta: float):
	#pass
	#
#func physics_update(delta: float):
	#
	#distance = Global.player_position.distance_to(owner.global_position)
	#
	#var dir : Vector2
	#var velocity := Vector2.ZERO
	#
	#if distance <= approaching_reach:
		#transitioned.emit(self, next_state)
		#
	#else:
		#dir = owner.to_local(nav_agent.get_next_path_position()).normalized()
		#velocity = dir * approaching_speed
		#make_path(Global.player_position)
	#
	#$"../..".velocity = velocity
	#$"../..".move_and_slide()
