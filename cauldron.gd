extends StaticBody2D

@export var smoke_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_initial_smoke_cloud()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass


# Create a circle around the cauldron with
# a distinct range away, given some variation further away
# the desired number of smoke particles in the ring
func create_smoke_ring(range : float, count : int, variation : float) -> void:
	for i in range(count):
	
		# Create a new instance of the Smoke Scene
		var smoke = smoke_scene.instantiate()
		
		# Grab the static point location to spawn from
		var smoke_spawn_location = $SmokeSpawnLocation
		
		# Set the smoke's direction prependicular to the path direction.
		var direction = smoke_spawn_location.rotation
		# Rotate the point so it will cover the full 360 degrees
		smoke_spawn_location.rotation += (2 * PI / count)
		
		# Create the ring at the desired range away, giving some randomness variation
		var layer = range + randf_range(0.0, variation)
		smoke.position = smoke_spawn_location.position + Vector2(layer, layer).rotated(direction)
		
		# Add some randomness to the direction.
		direction += randf_range(-PI / 4, PI / 4)
		smoke.rotation = direction
		
		# Choose the velocity for the mob.
		var velocity = Vector2(5.0, 20.0)
		smoke.linear_velocity = velocity.rotated(direction)
		
		# Spawn the smoke by adding it to the Main scene.
		add_child(smoke)

func create_initial_smoke_cloud() -> void:
	create_smoke_ring(100, 50, 0)
	create_smoke_ring(50, 50, 20)
	create_smoke_ring(10, 5, 10)
	
	
	

func _on_smoke_timer_timeout() -> void:
	# Create a new instance of the Mob Scene
	var smoke = smoke_scene.instantiate()
	
	# Continue the circle along the Path2D at an interval, it will reset to zero once it goes over 1
	var smoke_spawn_location = $SmokePath/SmokeSpawnLocation
	smoke_spawn_location.progress_ratio = smoke_spawn_location.progress_ratio + 0.1
	
	# Set the mob's position to the location
	smoke.position = smoke_spawn_location.position
	
	# Set the mob's direction prependicular to the path direction.
	var direction = smoke_spawn_location.rotation - (PI / 2)
	
	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	smoke.rotation = direction
	
	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(5.0, 10.0), 0.0)
	smoke.linear_velocity = velocity.rotated(direction)
	
	# Spawn the mob by adding it to the Main scene.
	add_child(smoke)
	
