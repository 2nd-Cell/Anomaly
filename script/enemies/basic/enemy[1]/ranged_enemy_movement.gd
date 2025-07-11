extends CharacterBody2D

signal Death

@export var health = 100
@onready var healthbar = $health_bar
var is_emitted_death = false

@export var damage = 10

func _ready() -> void:
	healthbar.init_health(health)

func take_damage(val: float) -> void:
	health -= val
	if health <= 0:
		if not is_emitted_death:
			Death.emit()
			is_emitted_death = true
		queue_free()
		
	healthbar.health = health

func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	pass

#extends CharacterBody2D
#
#signal Death
#signal fire
#
#@export var speed := 50.0
#@onready var player: Node2D = $"../player"
#@onready var nav_agent := $NavigationAgent2D
#
#@export var knockback_resistance := 50.0
#var knockback: Vector2 = Vector2.ZERO
#var knockback_timer: float = 0.0
#
#@export var health = 20
#@onready var healthbar = $health_bar
#var is_emitted_death = false
#
#@export var range := 200
#
#func _ready() -> void:
	#make_path(Global.player_position)
	#
	#healthbar.init_health(health)
#
#func _physics_process(delta: float) -> void:
	#var dir = to_local(nav_agent.get_next_path_position()).normalized()
	#
	#if Global.player_position.distance_to(position) <= range:
		#if Global.player_position.distance_to(position) <= range / 2:
			#dir = -dir
		#else:
			#dir = Vector2(0, 0)
		#fire.emit()
	#
	#if knockback_timer > 0.0:
		#velocity = knockback
		#knockback_timer -= delta
		#if knockback_timer <= 0.0:
			#knockback = Vector2.ZERO
	#else:
		#velocity = dir * speed + knockback
	#
	#move_and_slide()
	#knockback = Vector2(0,0)
	#
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if not collision.get_collider().get_meta("Enemy", false):
			#knockback += collision.get_collider_velocity()
		#
		#if health <= 0:
			#queue_free()
	##get_tree().call_group("level", "enemy_death")
##
#func make_path(pos:Vector2) -> void:
	#nav_agent.target_position = pos
#
#func take_damage(val: float) -> void:
	#health -= val
	#if health <= 0:
		#if not is_emitted_death:
			#Death.emit()
			#is_emitted_death = true
		#queue_free()
		#
	#healthbar.health = health
#
#func _on_timer_timeout() -> void:
	#make_path(Global.player_position)
#
#func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	#if knockback == Vector2.ZERO:
		#knockback = direction * force / knockback_resistance
	#knockback_timer = knockback_duration
