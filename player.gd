extends CharacterBody2D


signal lose_game


@export var speed = 400 # pixels per second player speed
var screen_size # game window size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


func _physics_process(delta: float) -> void:	
	var velocity = Vector2.ZERO
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed("move_right"):
		#velocity.x += 1
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= 1
	#if Input.is_action_pressed("move_down"):
		#velocity.y += 1
	#if Input.is_action_pressed("move_up"):
		#velocity.y -= 1
		#
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
#
	#position += velocity * delta
	#position = position.clamp(Vector2.ZERO, screen_size)


func _on_smoke_hitbox_body_entered(body: Node2D) -> void:	
	if body.is_in_group("Smoke"):
		print("Smoke hit, you lose!")
		lose_game.emit()
