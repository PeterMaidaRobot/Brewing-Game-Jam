extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_goal_win_game() -> void:
	$GUI.show_you_win()


func _on_player_lose_game() -> void:
	$GUI.show_you_lose()
