extends StaticBody2D

var pos

func _ready():
	pos = get_position()
	print(pos)

func get_pos():
	return pos
