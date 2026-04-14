class_name Smoke
extends RigidBody2D

var fan_direction : Vector2 = Vector2(0.0, 0.0)
var strength : int = 2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	linear_velocity += fan_direction # TODO it's bad to set linear_velocity every frame apparently... need forces instead

	strength -= 1
	if strength < 200:
		# Create an opacity tween to dim the alpha channel to 10% before we snap it out of existence
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.1, 5)
	if strength <= 0:
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	# Free this memory once it leaves the screen
	queue_free()
