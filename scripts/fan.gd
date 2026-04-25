extends StaticBody2D
class_name Fan


@export var fan_on : bool = false
@export var child_breeze_dir : Vector2

var player_in_range : bool = false # TODO this needs to be assessed!!! might be inaccurate on boot-up, though interact text will not be shown, exit and re-enter.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if fan_on:
		turn_on()
	else:
		turn_off()
	$Breeze.breeze_direction = child_breeze_dir
	if child_breeze_dir == Vector2(0.0, 0.0):
		print("Error, no breeze dir set!!")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range:
		# Toggle the fan
		fan_on = !fan_on
		if fan_on:
			turn_on()
		else:
			turn_off()

func turn_on() -> void:
	fan_on = true
	$FanOnSprite.show()
	$FanOffSprite.hide()
	$Breeze.set_enabled(true)
	
func turn_off() -> void:
	fan_on = false
	$FanOnSprite.hide()
	$FanOffSprite.show()
	$Breeze.set_enabled(false)
	


func _on_interact_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_range = true
		$InteractText.show()


func _on_interact_trigger_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_range = false
		$InteractText.hide()


func _on_yellow_smoke_trigger_body_entered(body: Node2D) -> void:
	if body is YellowSmoke:
		turn_on()
