extends stats
class_name player_stats

@export var health: float
@export var speed: float

func get_values() -> Dictionary:
	return {"HEALTH": health, "SPEED": speed}
