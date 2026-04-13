extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_enabled(on : bool) -> void:
	$CollisionShape2D.disabled = !on
	if on:
		$TextureRect.show()
	else:
		$TextureRect.hide()


func _on_body_entered(body: Node2D) -> void:
	if body is Smoke:
		var smoke : Smoke = body as Smoke
		smoke.fan_direction += Vector2(0.0, -1.0)
		
func _on_body_exited(body: Node2D) -> void:
	if body is Smoke:
		var smoke : Smoke = body as Smoke
		smoke.fan_direction += Vector2(0.0, +1.0)
