class_name enemy_stats

extends Resource

@export var texture: Texture2D

@export var max_health := 10.0

@export var max_speed := 70.0
@export var variation_range := 10.0
@export var acceleration_time := 2.5
@export var friction := 1.0
@export var enemy_type := ''
# don't forget to uncomment
#@export var loot_table : LootTable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
