extends Airborne
class_name Butterfly



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "fly"
	$AnimatedSprite2D.play()
	# Pick a random frame
	$AnimatedSprite2D.frame = randi_range(0, $AnimatedSprite2D.sprite_frames.get_frame_count("fly"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Call the process for Airbornes:
	super._process(delta)
	
	# Get a random direction, if it goes over the max speed, don't add it
	var new_dir : Vector2 = Vector2(randf_range(-0.5, 0.5),
								   randf_range(-0.5, 0.5))
	if (linear_velocity+new_dir).length() < 6:
		linear_velocity += new_dir



func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# Free this memory once it leaves the screen
	queue_free()
