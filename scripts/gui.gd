extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$WinLabel.hide()
	$LoseLabel.hide()
	$RestartLabel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func show_you_win() -> void:
	$WinLabel.show()
	
func show_you_lose() -> void:
	$LoseLabel.show()
	$RestartLabel.show()
