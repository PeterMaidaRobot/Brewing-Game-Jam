class_name Player
extends CharacterBody2D


signal lose_game


@export var speed : int = 400 # pixels per second player speed
var screen_size : Vector2 # game window size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:	
	var velocity : Vector2 = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	move_and_slide()


func _on_smoke_hitbox_body_entered(body: Node2D) -> void:	
	if body is Smoke:
		# Only allow the stronger smoke to kill you to be more forgiving on loss
		var smoke : Smoke = body as Smoke
		if smoke.strength > 100:
			#print("Smoke hit, you lose! SmokeStrength:" + str(body.strength))
			lose_game.emit()
