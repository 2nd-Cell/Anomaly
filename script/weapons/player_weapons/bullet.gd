class_name Bullet
extends CharacterBody2D

@export var speed := 300.0
@export var damage := 5.0
@export var max_pierce := 1
@onready var collision := $CollisionShape2D
var current_pierce_count := 0


func _ready():	
	pass

func _physics_process(delta: float) -> void:
	
	var direction = Vector2.RIGHT.rotated(rotation)
	
	velocity = direction*speed
	
	move_and_slide()
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if max_pierce > 0:
			if collision.get_collider().get_meta("Enemy", false):
				collision.get_collider().call("take_damage", damage)
				collision.get_collider().apply_knockback(direction, velocity.length(), 0.12)
			max_pierce -= 1
		
		if max_pierce <= 0:
			queue_free()
	
	move_and_slide()
