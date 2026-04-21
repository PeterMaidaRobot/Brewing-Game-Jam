extends Area2D

signal win_game

@export var next_level_num : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		win_game.emit()
		get_tree().change_scene_to_file.call_deferred(Constants.LEVEL_SCENE_PATH[next_level_num])
