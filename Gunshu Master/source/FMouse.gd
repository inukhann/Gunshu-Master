extends Position2D

var last_position

func _physics_process(delta):
	last_position = position
	position = get_global_mouse_position()
	
func get_last_position():
	return last_position
