extends RigidBody2D
class_name Airborne
'''
An airborne can be blowed by fans
'''

var fan_direction : Vector2 = Vector2(0.0, 0.0)


func _process(_delta: float) -> void:
	linear_velocity += fan_direction # TODO it's bad to set linear_velocity every frame apparently... need forces instead
