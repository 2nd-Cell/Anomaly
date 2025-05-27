extends CharacterBody2D

signal Death

@export var speed := 100.0
@onready var player: Node2D = $"../player"
@onready var nav_agent := $NavigationAgent2D

@export var knockback_resistance := 50
var knockback: Vector2 = Vector2(0,0)
@export var health = 100
@onready var healthbar = $health_bar
var is_emitted_death = false
func _ready() -> void:
	make_path(Global.player_position)
	
	healthbar.init_health(health)

func _physics_process(delta: float) -> void:
	var dir = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = dir * speed + knockback
	
	move_and_slide()
	knockback = Vector2(0,0)
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if not collision.get_collider().get_meta("Enemy", false):
			knockback = collision.get_collider_velocity() / knockback_resistance
		
		if health < 0:
			queue_free()
	#get_tree().call_group("level", "enemy_death")
#
func make_path(pos:Vector2) -> void:
	nav_agent.target_position = pos

func take_damage(val: float) -> void:
	health -= val
	if health < 0:
		if not is_emitted_death:
			Death.emit()
			is_emitted_death = true
		queue_free()
		
	healthbar.health = health

func _on_timer_timeout() -> void:
	make_path(Global.player_position)
