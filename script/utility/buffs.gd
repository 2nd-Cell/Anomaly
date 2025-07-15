extends Resource
class_name buff


@export var name: String
@export var increment: float
@export var duration: float # in seconds

@export_enum("ABS", "PER") var inc_type = "ABS"
@export_enum("PERM", "TEMP") var buff_type = "TEMP"

func calc_abs_val(base_val: float) -> float:
	if inc_type == "ABS":
		return increment
	else:
		return increment/100 * base_val
	return 0.0;
		
func update(delta: float):
	if buff_type == "TEMP":
		duration -= delta
		if duration < 0:
			increment = 0
		return duration
	return null
