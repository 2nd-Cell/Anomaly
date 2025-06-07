extends Node2D

@export var firing_position : Marker2D
@export var bullet_interval := 1.0
@export var magazine_interval = 4
var fire = true
var bullet_scene : PackedScene = preload("res://scene/enemies/basic/enemy[1]/EnemyBullet.tscn")
var countdown = 0.00001

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if fire:
		countdown -= delta
		fire = false
	
	if countdown <= 0:
		fire_bullet()
		countdown = bullet_interval

func _on_request_fire():
	fire = true

func fire_bullet():	
	# Spawn a bullet and give it a rotation based on the angle between the firing position and
	# the cursor's position.
	# The bullet will use this rotation to decide its direction.
	var spawned_bullet := bullet_scene.instantiate()
	var mouse_direction := Global.player_position - global_position
	spawned_bullet.global_position = firing_position.global_position
	spawned_bullet.rotation = mouse_direction.angle()
	get_tree().root.add_child(spawned_bullet)

func _on_enemy_ranged_fire() -> void:
	_on_request_fire()
