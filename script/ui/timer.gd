extends Control

var time:float = 3.0
var sec:int = 0

func set_time(tm):
	time = tm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("wavetimer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time -= delta
	sec = clamp(time, 0, INF)
	
	$Label.text = "%02d"%sec
