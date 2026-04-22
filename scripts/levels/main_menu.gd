extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setup the callbacks
	setup_buttons()
	# Then show the main menu
	show_main_menu()
	

'''
Initialize the callbacks to the menu buttons:
	* Mouse entered -> get focus
	* Focus gaines -> wiggle button
'''
func setup_buttons() -> void:
	var buttons : Array[Button] = [
		$MenuScreen/NewGameButton,
		$MenuScreen/LevelSelectButton,
		$LevelScreen/BackButton,
		$LevelScreen/IntroButton,
		$LevelScreen/Level1Button,
		$LevelScreen/Level2Button,
		$LevelScreen/Level3Button,
		$LevelScreen/Level4Button,
		$LevelScreen/FinaleButton,
	]
	for button : Button in buttons:
		button.mouse_entered.connect(func() -> void: button.grab_focus())
		button.focus_entered.connect(func() -> void: wiggle(button))


func wiggle(node : Button) -> void:
	var tween : Tween = create_tween()
	tween.tween_property(node, "rotation", 0.2, 0.2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(node, "rotation", -0.2, 0.2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(node, "rotation", 0.1, 0.2).set_trans(Tween.TRANS_SINE)
	tween.tween_property(node, "rotation", 0, 0.2).set_trans(Tween.TRANS_SINE)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func show_main_menu() -> void:
	# Make sure the windows are set properly
	$MenuScreen.show()
	$LevelScreen.hide()
	
	# Grab focus to the NewGame button so the user can tab through
	$MenuScreen/NewGameButton.grab_focus()
	
func show_level_select_menu() -> void:
	$LevelScreen.show()
	$MenuScreen.hide()
	
	$LevelScreen/IntroButton.grab_focus()
	


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/cutscene.tscn")

# Navigate from the Main Menu to the Level Select screen
func _on_level_select_button_pressed() -> void:
	show_level_select_menu()

# Navigate back from the Level Select screen to the main menu
func _on_back_button_pressed() -> void:
	show_main_menu()

func _on_level_button_pressed(level_num: int) -> void:
	get_tree().change_scene_to_file(Constants.LEVEL_SCENE_PATH[level_num])
