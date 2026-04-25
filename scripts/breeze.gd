extends Area2D
class_name Breeze

@export var breeze_direction : Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func set_enabled(on : bool) -> void:
	$CollisionShape2D.set_deferred("disabled", !on)
	if on:
		$TextureRect.show()
	else:
		$TextureRect.hide()


func _on_body_entered(body: Node2D) -> void:
	if body is Smoke:
		var smoke : Smoke = body as Smoke
		smoke.fan_direction += breeze_direction
		
func _on_body_exited(body: Node2D) -> void:
	if body is Smoke:
		var smoke : Smoke = body as Smoke
		smoke.fan_direction -= breeze_direction
