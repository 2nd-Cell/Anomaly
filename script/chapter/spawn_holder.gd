extends Node2D
#essetially just a counter
@onready var current_level:=0
#the level is the key the amount of monsters is the value
func num_enemy_calc_fn(lvl):
	return lvl*10
#the monster we will be spawning in. 
@onready var monster_arr := [preload("res://scene/enemies/basic/enemy[2]/enemy_duplicator_main.tscn"), 
	preload("res://scene/enemies/basic/enemy[1]/enemy_ranged.tscn"), 
	preload("res://scene/enemies/basic/skreaver/skreaver.tscn"), 
	preload("res://scene/enemies/intermediate/snatcher/snatcher.tscn")]
#A random number genrerator to spawn from alternating spawn points.
@onready var rand=RandomNumberGenerator.new()
@onready var timer = $Interval
@onready var dead_enemies=0
var skip_spawn := false
var wave_enemies = 0

func _ready():
	add_to_group("spawner", true)
	get_tree().call_group("wavetimer", "set_time", 3)
	print("foooo")
	#spawn_enemies(1)

func run_timer(time: int) -> void:
	if not timer.is_stopped():
		timer.stop()
	timer.wait_time = time
	get_tree().call_group("wavetimer", "set_time", time)
	get_tree().call_group("waveCounter", "set_wave_state", true)
	timer.start()

func enemy_death(ent=null, ent_position=Vector2(0,0)):
	if ent != null:
		ent.position = ent_position
		add_child(ent)
	
	dead_enemies+=1
	if dead_enemies==wave_enemies:
		run_timer(10)

func spawn_enemies(num: int)->void:
	run_timer(clamp(num*5, 60, INF))
	for i in range(num):
		#rand.
		var m = monster_arr.pick_random().instantiate()
		#var m = monster_arr[2].instantiate()
		#we check the amount of children on our spawn holder 
		var spawn_length = $SpawnHolder.get_child_count()-1
		# then make a random number in that range
		var rand_num = rand.randi_range(0,spawn_length)
		# We use that number to randomly select a spawner node position to use 
		var spawn_position = $SpawnHolder.get_child(rand_num).global_position
		
		m.position = spawn_position #+ Vector2(10, 10)
		add_child(m)
		m.Death.connect(enemy_death)
		#This is just a fast way to create a timer similar to wait in python
		await get_tree().create_timer(2.0).timeout
	
func _on_interval_timeout() -> void:
	current_level+=1
	get_tree().call_group("waveCounter", "set_wave_num", current_level)
	wave_enemies = num_enemy_calc_fn(current_level) + wave_enemies - dead_enemies
	dead_enemies = 0
	spawn_enemies(num_enemy_calc_fn(current_level))
	
