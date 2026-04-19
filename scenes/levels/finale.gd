extends Node

var player_in_range : bool = false # TODO this needs to be assessed!!! might be inaccurate on boot-up, though interact text will not be shown, exit and re-enter.


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range:
		# End the game
		fill_cauldron()


func fill_cauldron() -> void:
	$Background_Full.show()
	$TheEndLabel.show()
	$ThanksLabel.show()


func _on_interact_trigger_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_range = true
		$InteractLabel.show()


func _on_interact_trigger_body_exited(body: Node2D) -> void:
	if body is Player:
		player_in_range = false
		$InteractLabel.hide()
