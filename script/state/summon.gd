extends psm
class_name summon

var spawnee = preload("res://scene/enemies/basic/enemy[2]/enemy_duplicator_base.tscn")

@export var summoning_speed := 50.0
@export var summoning_reach:= 150.0
var in_reach
var distance

@export var next_state : state

func _ready() -> void:
	pass

func enter():
	super()

func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	distance = Global.player_position.distance_to(owner.global_position)
	
	if distance >= summoning_reach:
		transitioned.emit(self, next_state)

func _on_cooldown_timeout() -> void:
	spawn_spawnee()

func spawn_spawnee():
	
	var m = spawnee.instantiate()
	m.position = owner.global_position + Vector2(30,30)
	get_tree().get_first_node_in_group("spawner").add_child(m)
	
		
