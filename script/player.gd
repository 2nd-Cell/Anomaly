extends CharacterBody2D

@export var SPEED = 150.0
@onready var AnimPlayer: = $AnimatedSprite2D
var PlayerState = "idle"
var aim_position : Vector2 = Vector2(1, 0)

@export var knockback_multiplier := 0
var knockback: Vector2 = Vector2(0,0)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var half_viewport = get_viewport_rect().size / 2.0
		aim_position = (event.position-half_viewport)
	

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	Global.player_position = position
	velocity = direction * SPEED + knockback

	move_and_slide()
	
	knockback = Vector2(0, 0)
	
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		knockback += collision.get_normal()
	knockback = knockback * knockback_multiplier

func PlayerStateController(state = "idle"):
	match(state):
		"idle":
			AnimPlayer.play("idle")
		_:
			AnimPlayer.play("idle")


func _ready() -> void:
	AnimPlayer.play("default")
	Global.player_position = position
