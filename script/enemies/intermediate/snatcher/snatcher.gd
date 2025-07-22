extends CharacterBody2D

signal Death

var ent = preload("res://scene/util/entity.tscn")

@export var health = 200
@onready var healthbar = $health_bar
var is_emitted_death = false

var damage = 10

func _ready() -> void:
	healthbar.init_health(health)

func take_damage(val: float) -> void:
	health -= val
	if health <= 0:
		if not is_emitted_death:
			var i = ent.instantiate()
			i.res = preload("res://resource/items/banana.tres")
			Death.emit(i, global_position)
			is_emitted_death = true
		queue_free()
		
	healthbar.health = health

func apply_knockback(direction: Vector2, force: float, knockback_duration: float) -> void:
	pass
