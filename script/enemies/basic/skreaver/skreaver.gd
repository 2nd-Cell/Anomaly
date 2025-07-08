extends CharacterBody2D

signal Death

var knockback: Vector2 = Vector2.ZERO
var knockback_timer: float = 0.0

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
	if !($state_machine.knockback_multiplier == 0.0) :
		velocity += direction * force * $state_machine.knockback_multiplier
		knockback_timer = knockback_duration
