extends state
class_name summon

@export var summoning_speed := 50.0
@export var retreating_reach:= 50.0
var distance

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
	distance = Global.player_position.distance_to(owner.global_position)
	
	if distance < retreating_reach:
		transitioned.emit(self, next_state)
	
	elif distance == retreating_reach:
		transitioned.emit(self, next_state)
		
func _on_cooldown_timeout() -> void:
	spawn_spawnee()
	
func spawn_spawnee():
	if in_range == true:
		var m = spawnee.instantiate()
		m.position = global_position + Vector2(30,30)
		get_tree().get_first_node_in_group("spawner").add_child(m)
