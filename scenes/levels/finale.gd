extends Node

var player_in_range : bool = false # TODO this needs to be assessed!!! might be inaccurate on boot-up, though interact text will not be shown, exit and re-enter.

var cauldron_empty : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# turn the timer off initially
	$Y_Sorted_Sprites/UNIQUE_SmokeSpawnerPath.start_timer(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and player_in_range and cauldron_empty:
		# End the game
		fill_cauldron()


func fill_cauldron() -> void:
	$Background_Full.show()
	$TheEndLabel.show()
	$ThanksLabel.show()
	$Y_Sorted_Sprites/UNIQUE_SmokeSpawnerPath.start_timer(true)
	# Don't let the interact label show anymore
	cauldron_empty = false
	$InteractLabel.hide()


func _on_interact_trigger_body_entered(body: Node2D) -> void:
	if body is Player and cauldron_empty:
		player_in_range = true
		$InteractLabel.show()


func _on_interact_trigger_body_exited(body: Node2D) -> void:
	if body is Player and cauldron_empty:
		player_in_range = false
		$InteractLabel.hide()
