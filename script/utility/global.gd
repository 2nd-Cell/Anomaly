extends Node
var scene_name
var player_position: Vector2
var time

@export var save_state_res: save_state = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if save_state_res == null:
		if !_load_save_state("user://autosave.tres"):
			save_state_res = save_state.new()

func _load_save_state(path) -> bool:
	if ResourceLoader.exists(path):
		save_state_res = ResourceLoader.load(path)
		return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Switch_Screen(scene: String):
	var loading_screen = load(scene_name) # Returns PackedScene
	get_tree().change_scene_to_packed(loading_screen)

func register_save_state_item(key: String, value, parent_res=null):
	if key == "player_stat":
		save_state_res.player_stat = value
	
	print(key)
	if key == null:
		pass
	if key in save_state_res.misc:
		print("[WARN]: Same item exists within save frame with the same key")
		print("	to update an existing value, call update_save_state_item")
		print("	not adding value to save frame !!")
		return -1
	else:
		save_state_res.misc[key] = value

func update_save_state_item(key:String, value, parent_res=null):
	if key not in save_state_res.misc:
		print("[WARN]: Same item does not exist within save frame with the same key")
		print("	to add a new value, call register_save_state_item")
		print("	not updating value to save frame !!")
		return -1
	else:
		save_state_res.misc[key] = value

func get_save_state_item(key: String):
	print(key)
	if key == "player_stats":
		return save_state_res.player_stat
	else:
		print("else")
		if key in save_state_res.misc:
			print(key, save_state_res.misc[key])
			return save_state_res.misc[key]
		else:
			return null

func save_world(save_path = "user://autosave.tres") -> bool:
	print("saving")
	ResourceSaver.save(save_state_res, save_path)
	return false
