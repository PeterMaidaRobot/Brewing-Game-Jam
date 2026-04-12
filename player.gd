extends CharacterBody2D


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


func _on_fan_collision_body_entered(body: Node2D) -> void:
	if body.is_in_group("Smoke"):
		body.fan_direction += Vector2(0.0, -1.0)
		
