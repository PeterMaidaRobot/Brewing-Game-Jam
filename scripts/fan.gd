extends StaticBody2D


@export var fan_on = false

var player_in_range : bool = false # TODO this needs to be assessed!!! might be inaccurate on boot-up, though interact text will not be shown, exit and re-enter.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if fan_on:
		turn_on()
	else:
		turn_off()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range:
		# Toggle the fan
		fan_on = !fan_on
		if fan_on:
			turn_on()
		else:
			turn_off()

func turn_on() -> void:
	$FanOnSprite.show()
	$FanOffSprite.hide()
	$Breeze.set_enabled(true)
	
func turn_off() -> void:
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
