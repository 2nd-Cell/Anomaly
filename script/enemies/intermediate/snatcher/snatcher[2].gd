extends CharacterBody2D

signal Death

@export var speed := 100.0
@onready var player: Node2D = $"../player"
@onready var nav_agent := $NavigationAgent2D

#@export var knockback_resistance := 50
#var knockback: Vector2 = Vector2.ZERO
#var knockback_timer: float = 0.0

@export var health = 200
@onready var healthbar = $health_bar
var is_emitted_death = false

var damage = 10

var multiplier = 1
var range := 200
@onready var timer = $Cooldown
const mul_boost := 5
var aim_pos : Vector2

func run_timer(time: int) -> void:
	if not timer.is_stopped():
		timer.stop()
	print("time:", time)
	timer.wait_time = time
	timer.start()

func _ready() -> void:
	make_path(Global.player_position)
	healthbar.init_health(health)

func _physics_process(delta: float) -> void:
	var dir : Vector2	# = to_local(nav_agent.get_next_path_position()).normalized()
	
	if Global.player_position.distance_to(position) <= range:
		if multiplier != 0 and multiplier != mul_boost:
			run_timer(3)
			multiplier = 0
		else:
			if position == aim_pos:
				multiplier = 1
				run_timer(2)
		aim_pos = Global.player_position + dir * mul_boost * 2
		dir = ( aim_pos - position ).normalized()
	else:
		dir = to_local(nav_agent.get_next_path_position()).normalized()
		if multiplier != 1:
			make_path(Global.player_position)
			timer.stop()
			multiplier = 1
		
	velocity = dir * speed * multiplier
	
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision.get_collider().get_meta("Player", false):
			collision.get_collider().take_damage(damage)
#
func make_path(pos:Vector2) -> void:
	nav_agent.target_position = pos

func take_damage(val: float) -> void:
	health -= val
	if health <= 0:
		if not is_emitted_death:
			Death.emit()
			is_emitted_death = true
		queue_free()
		
	healthbar.health = health

func _on_timer_timeout() -> void:
	make_path(Global.player_position)
	
func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	pass


func _on_cooldown_timeout() -> void:
	if multiplier == 0:
		multiplier = mul_boost
