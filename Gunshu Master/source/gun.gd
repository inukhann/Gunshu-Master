extends RigidBody2D

var MAX_SPEED = 5000
var MAX_DISTANCE = 550
var current_position
var last_position
var x
var y
var z
var theta
var clockwise
onready var front = $FrontTip
onready var end = $EndTip
onready var mous = $FMouse

func _ready():
	pass

func _integrate_forces(state):
	set_scale(Vector2(7,0.4))
#	print(Input.get_last_mouse_speed().length())
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("LMB"):
		set_xyz()
		if x != 0.0 and y != z:
			theta = acos( (x*x - y*y - z*z) / (-2*y*z) )
#			print(str(x)+","+str(y)+","+str(z)+ "and - " + str(theta))
			if theta != 0:
				rotate(theta*clockwise)
	elif Input.is_action_pressed("RMB"):
		set_xyz()
		if x != 0.0 and y != z:
			theta = acos( (x*x - y*y - z*z) / (-2*y*z) )
#			print(str(x)+","+str(y)+","+str(z)+ "and - " + str(theta))
			if theta != 0:
				rotate(-theta*-clockwise)

func set_xyz():
	last_position = mous.get_last_position()
	current_position = mous.position
	x = current_position.distance_to(last_position)
	y = last_position.distance_to(global_position)
	z = current_position.distance_to(global_position)
	var angle_diff = current_position.angle_to_point(global_position) - last_position.angle_to_point(global_position)
	print(angle_diff)
	if angle_diff >= 0.0:
		clockwise = 1
	else:
		clockwise = -1
