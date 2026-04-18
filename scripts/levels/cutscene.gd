extends CanvasLayer


var panel_index : int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Make sure everything is hidden
	$Panels/BigFacePanel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("interact"):
		panel_index += 1
		update_panel(panel_index)


func update_panel(new_panel_index : int) -> void:
	
	match new_panel_index:
		# TODO there's def a better way than this... though I don't want to do get_node("Cutscene" + index) for lack of syntax checking
		2:
			$Panels/Cutscene2.show()
		3:
			$Panels/Cutscene3.show()
		4:
			$Panels/Cutscene4.show()
		5:
			$Panels/Cutscene5.show()
		6:
			$Panels/Cutscene6.show()
		7:
			$Panels/Cutscene7.show()
		8:
			$Panels/Cutscene8.show()
		9:
			$Panels/Cutscene9.show()
		10:
			$Panels/Cutscene10.show()
		11:
			$Panels/Cutscene11.show()
		12:
			$Panels/Cutscene12.show()
		13:
			$Panels/Cutscene13.show()
		14:
			$Panels/BigFacePanel.show()
		15:
			get_tree().change_scene_to_file(Constants.LEVEL_SCENE_PATH[0])
