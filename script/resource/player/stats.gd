extends Resource
class_name player_stats

@export var health: float
@export var speed: float

var permanent_buff := []
var temporary_buff := []

func _add_perm_buff(stat, alt_type, value):
	
	permanent_buff.append([stat, alt_type, value])
	
	#if stat == "SPEED":
	
func _add_temp_buff(stat, alt_type, value, duration):
	
	temporary_buff.append([stat, alt_type, value, duration])

func compute_buff(delta: float, stat):
	
	var buff = 0
	
	for i in permanent_buff:
		
		if i[0] == stat :
			if i[1] == "ABS" :
				buff += i[2]
			#elif i[1] == "PER":
				#buff += 
