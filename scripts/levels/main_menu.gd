extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_main_menu()
	
	# Let the mouse also grab focus in addition to the keyboard
	mouse_focuses_children($MenuScreen/VBoxContainer)
	mouse_focuses_children($LevelScreen/HBoxContainer)
	$LevelScreen/BackButton.mouse_entered.connect(func() -> void: $LevelScreen/BackButton.grab_focus())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

# This function will turn on the mouse entered event to focus each of the
# children buttons in the provided vbox or hbox
func mouse_focuses_children(container : Container) -> void:
	for child in container.get_children():
		if child is Button:
			child.mouse_entered.connect(func() -> void: child.grab_focus())


func show_main_menu() -> void:
	# Make sure the windows are set properly
	$MenuScreen.show()
	$LevelScreen.hide()
	
	# Grab focus to the NewGame button so the user can tab through
	$MenuScreen/VBoxContainer/NewGameButton.grab_focus()
	
func show_level_select_menu() -> void:
	$LevelScreen.show()
	$MenuScreen.hide()
	
	$LevelScreen/BackButton.grab_focus()
	


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
