extends Path2D

@export var green_smoke_scene : PackedScene
@export var blue_smoke_scene : PackedScene
@export var yellow_smoke_scene : PackedScene

enum Smoke_Type {Green, Blue, Yellow}
@export var smoke_type : Smoke_Type

var smoke_scene : PackedScene

@export var random_spawn : bool = false
@export var timer_wait_time : float = 0.05



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_smoke_scene(smoke_type)
	$SmokeTimer.wait_time = timer_wait_time


func set_smoke_scene(type : Smoke_Type) -> void:
	# Set the type and then reset the scene used
	smoke_type = type
	match smoke_type:
		Smoke_Type.Green:
			smoke_scene = green_smoke_scene
		Smoke_Type.Blue:
			smoke_scene = blue_smoke_scene
		Smoke_Type.Yellow:
			smoke_scene = yellow_smoke_scene


func start_timer(on : bool) -> void:
	if on:
		$SmokeTimer.start()
	else:
		$SmokeTimer.stop()



func spawn_smoke() -> void:
	# Create a new instance of the Mob Scene
	var smoke : Node = smoke_scene.instantiate()
	
	# Continue the circle along the Path2D at an interval, it will reset to zero once it goes over 1
	var smoke_spawn_location : PathFollow2D = $SmokeSpawnLocation
	if random_spawn:
		smoke_spawn_location.progress_ratio = randf_range(0.0, 1.0)
	else:
		# increment by a set amount
		smoke_spawn_location.progress_ratio = smoke_spawn_location.progress_ratio + 0.1
	
	# Set the mob's position to the location
	smoke.position = smoke_spawn_location.position
	
	# Set the mob's direction prependicular to the path direction.
	var direction : float = smoke_spawn_location.rotation - (PI / 2)
	
	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	smoke.rotation = direction
	
	# Choose the velocity for the mob.
	var smoke_velocity : float = 10.0
	var velocity : Vector2 = Vector2(randf_range(smoke_velocity - 5.0, smoke_velocity), smoke_velocity)
	smoke.linear_velocity = velocity.rotated(direction)
	
	# Spawn the mob by adding it to the Main scene.
	add_child(smoke)


func _on_smoke_timer_timeout() -> void:	
	spawn_smoke()
	
