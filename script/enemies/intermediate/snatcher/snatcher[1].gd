extends CharacterBody2D

signal Death

@export var health = 200
@onready var healthbar = $health_bar
var is_emitted_death = false

var damage = 10

func _ready() -> void:
	healthbar.init_health(health)

#func _physics_process(delta: float) -> void:
	#move_and_slide()

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
