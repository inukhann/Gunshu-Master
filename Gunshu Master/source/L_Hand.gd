extends KinematicBody2D

var center
var shoulder
var shoulder_direction
var max_distance

func _ready():
	shoulder = Vector2(3.5,-16.85)
	max_distance = get_position().distance_to(shoulder)

func _unhandled_input(event):
	if Input.is_action_pressed("LMB"):
		if get_position().distance_to(shoulder) <= max_distance and event is InputEventMouseMotion: 
			set_position(get_position() + event.get_relative())
		else:
			set_position(get_position() + shoulder_direction)
	else:
		shoulder_direction = get_position().direction_to(shoulder).normalized()
		if get_position().distance_to(shoulder) > max_distance:
			set_position(get_position() + shoulder_direction)
