extends Node
class_name Level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var gui_scene = load("res://scenes/gui.tscn")
	if gui_scene != null:
		var gui_instance = gui_scene.instantiate()
		add_child(gui_instance)
	else:
		push_error("Failed to load GUI Scene")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handle_restart()

func handle_restart() -> void:
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_goal_win_game() -> void:
	$GUI.show_you_win() # This does nothing since we move to the next level immediately with a congrats


func _on_player_lose_game() -> void:
	$GUI.show_you_lose()
	$Player.vomit()
