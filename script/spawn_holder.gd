extends Node2D
#essetially just a counter
@onready var current_level=0
#the level is the key the amount of monsters is the value
@onready var monster_dict={
 1:3000,
 2:2,
 3:4,
 4:8,
 5:30
}
#the monster we will be spawning in. 
@onready var monster=preload("res://scene/enemy.tscn")
#A random number genrerator to spawn from alternating spawn points.
@onready var rand=RandomNumberGenerator.new()
#@onready var dead_enemies=0

#func enemy_death():
	#print("enemy death")
	#dead_enemies+=1
	#if dead_enemies==monster_dict[current_level]:
		#$Interval.start()
		#dead_enemies=0
	#get_tree().call_group("player", "award_points", 200)

func spawn_enemies():
	for i in range($SpawnHolder.get_child_count()):
		print($SpawnHolder.get_child(i))
		print($SpawnHolder.get_child(i).position)
	for i in range(monster_dict[current_level]):
		var m = monster.instantiate()

		#we check the amount of children on our spawn holder 
		var spawn_length = $SpawnHolder.get_child_count()-1
		# then make a random number in that range
		var rand_num = rand.randi_range(0,spawn_length)
		# We use that number to randomly select a spawner node position to use 
		var spawn_position = $SpawnHolder.get_child(rand_num).global_position
		#var rect: Rect2 = Rect2(spawn_position-Vector2(2,2), spawn_position+Vector2(2,2))
#
		#for node in get_nodes_in_area(rect):
			#if node is Node2D:
				#pass
		#we add the monster as a child of the level
		#We set the monsters position to the spawn location
		m.position = spawn_position #+ Vector2(10, 10)
		add_child(m)
		#This is just a fast way to create a timer similar to wait in python
		await get_tree().create_timer(2.0).timeout
  
func update_level():
	spawn_enemies()

func _on_interval_timeout() -> void:
	current_level+=1
	update_level() # Replace with function body.
