extends Node

@export var base_stats: stats

var _states = {} # Example format: "state_name": {"base_val": 120, "applied_effects":[]}

func _ready():
	var temp = base_stats.get_values()
	for prop in temp:
		_states[prop] = {"base_val": temp[prop], "applied_effects": []}
	var prev_state = Global.get_save_state_item("player_buffs")
	if prev_state == null:
		Global.register_save_state_item("player_buffs", _states)
	else:
		_states = prev_state

func add_buff(_buff: buff):
	if _buff.name in _states:
		_states[_buff.name]["applied_effects"].append(_buff)
		return len(_states[_buff.name]["applied_effects"]) - 1
	
func remove_buff(_buff: buff):
	if _buff.name in _states:
		if _buff in _states[_buff.name]["applied_effects"]:
			_states[_buff.name]["applied_effects"].erase(_buff)
	
func calc_buff(buff_name: String):
	var val = 0
	if buff_name in _states:
		for i in _states[buff_name]["applied_effects"]:
			val += i.calc_abs_val(_states[buff_name]["base_val"])
	return val

func _physics_process(delta: float) -> void:
	var to_remove = []
	for buff_name in _states:
		for i in _states[buff_name]["applied_effects"]:
			if i != null and i.has_method("update"):
				var dur = i.update(delta)
				if dur != null and dur < 0:
					to_remove.append(i)
	
	for i in to_remove:
		remove_buff(i)
	
	Global.update_save_state_item("player_buffs", _states)

func _on_area_2d_buff_signaled(_buff: buff) -> void:
	add_buff(_buff)
