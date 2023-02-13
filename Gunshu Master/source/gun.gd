extends RigidBody2D

var SPEED_MOD = 0.5
var MAX_DISTANCE
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
	MAX_DISTANCE = position.length() + 1

func _integrate_forces(state):
	set_scale(Vector2(7,0.4))
#	print(Input.get_last_mouse_speed().length())
	pass
	
func _physics_process(delta):
	if Input.is_action_pressed("LMB"):
		set_xyz()
		rotate_gwan(x,y,z, clockwise)
		move_gwan()
	elif Input.is_action_pressed("RMB"):
		set_xyz()
		rotate_gwan(x,y,z, -clockwise)
		move_gwan()

func set_xyz():
	last_position = mous.get_last_position()
	current_position = mous.position
	x = current_position.distance_to(last_position)
	y = last_position.distance_to(get_parent().global_position)
	z = current_position.distance_to(get_parent().global_position)
	var angle_diff = current_position.angle_to_point(get_parent().global_position) - last_position.angle_to_point(get_parent().global_position)
#	print(position)
	if angle_diff >= 0.0:
		clockwise = 1
	else:
		clockwise = -1
		
func rotate_gwan(x, y, z, clockwise):
	if y != 0.0 and z != 0.0:
			theta = acos( (x*x - y*y - z*z) / (-2*y*z) )
#			print(str(x)+","+str(y)+","+str(z)+ "and - " + str(theta))
			if theta != 0:
				rotate(theta*clockwise)

func move_gwan():
	var last_lenght = position.distance_to(Vector2.ZERO)
	var movement = position + (current_position - last_position) * SPEED_MOD
	print(str(movement.distance_to(Vector2.ZERO)) + " ; " + str(last_lenght))
	if movement.distance_to(Vector2.ZERO) <= MAX_DISTANCE or movement.distance_to(Vector2.ZERO) <= last_lenght:
		self.position = movement
