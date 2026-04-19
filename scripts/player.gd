class_name Player
extends CharacterBody2D


signal lose_game


@export var speed : int = 200 # pixels per second player speed
var screen_size : Vector2 # game window size
var accept_input : bool = true # accepts directional input from the player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:
	var velocity : Vector2 = Vector2.ZERO
	if accept_input:
		if Input.is_action_pressed("move_right"):
			velocity.x += 1
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D.flip_h = false
		if Input.is_action_pressed("move_left"):
			velocity.x -= 1
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D.flip_h = true
		if Input.is_action_pressed("move_down"):
			velocity.y += 1
			$AnimatedSprite2D.animation = "walk_down"
		if Input.is_action_pressed("move_up"):
			velocity.y -= 1
			$AnimatedSprite2D.animation = "walk_up"
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()

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
			
func vomit() -> void:
	$AnimatedSprite2D.animation = "vomit"
	$AnimatedSprite2D.play()
	accept_input = false
