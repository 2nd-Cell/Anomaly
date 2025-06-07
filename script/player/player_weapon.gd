extends Node2D

@export var firing_position : Marker2D
@export var bullet_interval = 0.1
@export var magazine_interval = 4
@onready var player : CharacterBody2D = get_owner()

var bullet_scene : PackedScene = preload("res://scene/bullet/bullet.tscn")
var countdown = 0.00001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("primary_fire"):
		countdown -= delta
	
	if countdown <= 0:
		fire_bullet()
		countdown = bullet_interval

func fire_bullet():
	# If we're aiming at a different side, flip the firing position across the X axis
	if sign(player.aim_position.x) != sign(firing_position.position.x):
		firing_position.position.x *=-1
	
	# Spawn a bullet and give it a rotation based on the angle between the firing position and
	# the cursor's position.
	# The bullet will use this rotation to decide its direction.
	var spawned_bullet := bullet_scene.instantiate()
	var mouse_direction := get_global_mouse_position() - firing_position.global_position
	
	spawned_bullet.global_position = firing_position.global_position
	spawned_bullet.rotation = mouse_direction.angle()
	get_tree().root.add_child(spawned_bullet)
