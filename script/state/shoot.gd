extends psm
class_name shooting

var bullet_scene : PackedScene = preload("res://scene/enemies/basic/enemy[1]/EnemyBullet.tscn")
@export var shooting_position : Marker2D
@export var bullet_interval := 1.0
@export var magazine_interval = 4
@export var shooting_reach:= 250.0
var in_reach
var distance

@export var next_state : state

func enter():
	super()

func exit():
	super()

func update(delta: float):
	super(delta)
	
func physics_update(delta: float):
	super(delta)
	
	distance = Global.player_position.distance_to(owner.global_position)
	
	if distance >= shooting_reach:
		transitioned.emit(self, next_state)
	
	if $"Cooldown".is_stopped():
		$"Cooldown".start()

func _on_cooldown_timeout() -> void:
	fire_bullet()

func fire_bullet():
	# Spawn a bullet and give it a rotation based on the angle between the firing position and
	# the cursor's position.
	# The bullet will use this rotation to decide its direction.
	var spawned_bullet := bullet_scene.instantiate()
	var mouse_direction : Vector2 = Global.player_position - $"../..".global_position
	spawned_bullet.global_position = shooting_position.global_position
	spawned_bullet.rotation = mouse_direction.angle()
	get_tree().root.add_child(spawned_bullet)
