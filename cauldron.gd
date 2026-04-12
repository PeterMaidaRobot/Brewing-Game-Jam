extends StaticBody2D

@export var smoke_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	pass


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
	
