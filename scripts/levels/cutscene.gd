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
	
	match new_panel_index: # TODO there's def a better way than this...
		2:
			$Panels/BigFacePanel.show()
		3:
			get_tree().change_scene_to_file(Constants.LEVEL_SCENE_PATH[0])
