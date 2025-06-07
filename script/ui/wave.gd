extends Control

var wave = false
var wave_val: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("waveCounter")

func set_wave_state(waveState) -> void:
	wave = waveState

func set_wave_num(waveVal) -> void:
	wave_val = waveVal

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if wave:
		$wave_num.text = "%02d"%wave_val
