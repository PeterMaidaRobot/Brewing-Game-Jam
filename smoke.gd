extends RigidBody2D

var fan_direction : Vector2 = Vector2(0.0, 0.0) 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity += fan_direction


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# Free this memory once it leaves the screen
	queue_free()
