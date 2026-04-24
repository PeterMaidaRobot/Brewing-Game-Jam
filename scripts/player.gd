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
	if accept_input:
		# Grab a normalized vector for the player's input
		var direction : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		if Input.is_action_pressed("move_right"):
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D.flip_h = false
		if Input.is_action_pressed("move_left"):
			$AnimatedSprite2D.animation = "walk_right"
			$AnimatedSprite2D.flip_h = true
		if Input.is_action_pressed("move_down"):
			$AnimatedSprite2D.animation = "walk_down"
		if Input.is_action_pressed("move_up"):
			$AnimatedSprite2D.animation = "walk_up"
		
		if direction.length() > 0:
			position += (direction * speed) * delta
			position = position.clamp(Vector2.ZERO, screen_size)
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
		
		move_and_slide()


func _on_smoke_hitbox_body_entered(body: Node2D) -> void:	
	if body is GreenSmoke:
		# Only allow the stronger smoke to kill you to be more forgiving on loss
		var smoke : Smoke = body as Smoke
		if smoke.strength > 100:
			#print("Smoke hit, you lose! SmokeStrength:" + str(body.strength))
			lose_game.emit()
			
func vomit() -> void:
	$AnimatedSprite2D.animation = "vomit"
	$AnimatedSprite2D.play()
	accept_input = false
