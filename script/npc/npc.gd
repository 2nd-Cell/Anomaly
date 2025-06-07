extends CharacterBody2D
@export var speed = 50
var rng = RandomNumberGenerator.new()
var direction
var spawn_position = position
var direction_reversed = false

func _ready() -> void:
	change_direction()
	spawn_position = position

func _physics_process(delta: float) -> void:
	velocity = speed*direction
	
	if position.distance_to(spawn_position) > 50 and !direction_reversed :
		direction = -direction
		direction_reversed = true
	move_and_slide()

func change_direction():
	direction_reversed = false
	var spawn_direction = (position - spawn_position).normalized()
	
	if rng.randf_range(0, 1) > 0.5 :
		direction = Vector2(rng.randf_range(-1,1), rng.randf_range(-1,1)).normalized() #.cross(spawn_direction)
	else :
		direction = Vector2(0, 0)
	
	
func _on_timer_timeout() -> void:
	change_direction()
