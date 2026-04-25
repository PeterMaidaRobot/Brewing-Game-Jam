extends Airborne
class_name Butterfly



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "fly"
	$AnimatedSprite2D.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Call the process for Airbornes:
	super._process(delta)
	
	if linear_velocity.length() < 10:
		linear_velocity += Vector2(randf_range(-0.5, 0.5),
								   randf_range(-0.5, 0.5))



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# Free this memory once it leaves the screen
	queue_free()
