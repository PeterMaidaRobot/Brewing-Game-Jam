extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Make sure the windows are set properly
	$MenuScreen.show()
	$LevelScreen.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/cutscene.tscn")

# Navigate from the Main Menu to the Level Select screen
func _on_level_select_button_pressed() -> void:
	$LevelScreen.show()
	$MenuScreen.hide()

# Navigate back from the Level Select screen to the main menu
func _on_back_button_pressed() -> void:
	$MenuScreen.show()
	$LevelScreen.hide()

func _on_level_button_pressed(level_num: int) -> void:
	get_tree().change_scene_to_file(Constants.LEVEL_SCENE_PATH[level_num])
