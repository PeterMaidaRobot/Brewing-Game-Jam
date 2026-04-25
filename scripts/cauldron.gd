extends StaticBody2D

@export var green_smoke_scene : PackedScene
@export var blue_smoke_scene : PackedScene
@export var yellow_smoke_scene : PackedScene

enum Smoke_Type {Green, Blue, Yellow}
@export var smoke_type : Smoke_Type

var smoke_scene : PackedScene



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match smoke_type:
		Smoke_Type.Green:
			smoke_scene = green_smoke_scene
		Smoke_Type.Blue:
			smoke_scene = blue_smoke_scene
		Smoke_Type.Yellow:
			smoke_scene = yellow_smoke_scene
	$SmokeSpawnerPath.set_smoke_scene(smoke_type)
	create_initial_smoke_cloud()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:	
	pass


# Create a circle around the cauldron with
# a distinct radius range away, given some variation further away
# the desired number of smoke particles in the ring
func create_smoke_ring(radius : float, count : int, variation : float, init_strength : int) -> void:
	for i in range(count):
	
		# Create a new instance of the Smoke Scene
		var smoke : Node = smoke_scene.instantiate()
		
		# Grab the static point location to spawn from
		var smoke_spawn_location : Marker2D = $SmokeSpawnLocation
		
		# Set the smoke's direction prependicular to the path direction.
		var direction : float = smoke_spawn_location.rotation
		# Rotate the point so it will cover the full 360 degrees
		smoke_spawn_location.rotation += (2 * PI / count)
		
		# Create the ring at the desired radius away, giving some randomness variation
		var layer : float = radius + randf_range(0.0, variation)
		smoke.position = smoke_spawn_location.position + Vector2(layer, layer).rotated(direction)
		
		# Add some randomness to the direction.
		direction += randf_range(-PI / 8, PI / 8)
		smoke.rotation = direction
		
		# Choose the velocity for the mob.
		var ring_smoke_velocity : float = 10.0
		var velocity : Vector2 = Vector2(ring_smoke_velocity, ring_smoke_velocity)
		smoke.linear_velocity = velocity.rotated(direction)
		
		# Spawn the smoke by adding it to the Main scene.
		smoke.init(init_strength)
		add_child(smoke)

func create_initial_smoke_cloud() -> void:
	#var init_strength : int = 800 - (range * 12)
	create_smoke_ring(60, 50, 0, 200)
	create_smoke_ring(30, 50, 20, 350)
	create_smoke_ring(10, 40, 10, 500)
	create_smoke_ring(0, 20, 0, 600)
	
	
