extends CharacterBody2D

signal Death
#

@export var stats: player_stats

#var PlayerState = "idle"
var aim_position : Vector2 = Vector2(1, 0)
#
@export var knockback_multiplier := 1500
var knockback: Vector2 = Vector2(0,0)
#
@export var health = 100
@onready var healthbar = $health_bar
var is_emitted_death = false
#
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var half_viewport = get_viewport_rect().size / 2.0
		aim_position = (event.position-half_viewport)
	if event is InputEventMouseButton:
		if event.is_pressed():
			# zoom in
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				$Camera2D.zoom += Vector2(0.2, 0.2)
				if $Camera2D.zoom.length() > 10:
					$Camera2D.zoom = Vector2(10, 10)
				# call the zoom function
			# zoom out
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				$Camera2D.zoom -= Vector2(0.2, 0.2)
				if $Camera2D.zoom.length() < 2:
					$Camera2D.zoom = Vector2(2, 2)
				# call the zoom function
#
func _physics_process(delta: float) -> void:
	#var direction = Input.get_vector("left", "right", "up", "down")
	#Global.player_position = position
	#velocity = direction * SPEED + knockback
#
	#move_and_slide()
	#
	knockback = Vector2(0, 0)
	#
	#for i in range(get_slide_collision_count()):
		#var collision = get_slide_collision(i)
		#if collision.get_collider().get_meta("Enemy", false):
			#knockback += collision.get_normal()
	#
	knockback = knockback * knockback_multiplier
#
#func PlayerStateController(state = "idle"):
	#match(state):
		#"idle":
			#AnimPlayer.play("idle")
		#_:
			#AnimPlayer.play("idle")
#
#
func _ready() -> void:
	#AnimPlayer.play("default")
	#Global.player_position = position
	#
	healthbar.init_health(health)
#
func take_damage(val: float) -> void:
	print(health)
	#health -= val
	if health <= 0:
		if not is_emitted_death:
			Death.emit()
			is_emitted_death = true
		var loading_screen = load("res://scene/screen/title_screen.tscn") # Returns PackedScene
		get_tree().change_scene_to_packed(loading_screen)
		#
	healthbar.health = health
