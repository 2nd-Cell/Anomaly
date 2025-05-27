extends Node2D

#essetially just a counter
@onready var current_level:=0
#the level is the key the amount of monsters is the value
func num_enemy_calc_fn(lvl):
	return lvl*10
#the monster we will be spawning in. 
@onready var monster=preload("res://scene/enemy.tscn")
#A random number genrerator to spawn from alternating spawn points.
@onready var rand=RandomNumberGenerator.new()
@onready var timer = $Interval
@onready var dead_enemies=0
var skip_spawn := false
var wave_enemies = 0

func run_timer(time: int) -> void:
	if not timer.is_stopped():
		timer.stop()
	timer.wait_time = time
	timer.start()

func enemy_death():
	dead_enemies+=1
	#print(dead_enemies==num_enemy_calc_fn(current_level), "||", dead_enemies, "||", num_enemy_calc_fn(current_level))
	if dead_enemies==wave_enemies:
		print("clear via clean")
		run_timer(10)

func spawn_enemies(num: int)->void:
	for i in range(num):
		var m = monster.instantiate()
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
	run_timer(60)
	

func _process(delta: float) -> void:
	print(timer.time_left, "||", dead_enemies, "||", wave_enemies)

func _on_interval_timeout() -> void:
	print("timeout")
	current_level+=1
	wave_enemies = num_enemy_calc_fn(current_level) + wave_enemies - dead_enemies
	dead_enemies = 0
	spawn_enemies(num_enemy_calc_fn(current_level))
