extends KinematicBody2D

var current_velocity
onready var ls = $Sprite/L_Shoulder
onready var rs = $Sprite/R_Shoulder

func _physics_process(_delta):
	#look_at(get_global_mouse_position())
	if Input.is_key_pressed(KEY_SHIFT):
		current_velocity = 200
	elif Input.is_action_pressed("Jump"):
		current_velocity = 200
	else:
		current_velocity = 100
	player_movement(current_velocity)
	
func player_movement(vel):
	if Input.is_key_pressed(KEY_A):
		move_and_slide(Vector2.LEFT*vel)
	if Input.is_key_pressed(KEY_S):
		move_and_slide(Vector2.DOWN*vel)
	if Input.is_key_pressed(KEY_W):
		move_and_slide(Vector2.UP*vel)
	if Input.is_key_pressed(KEY_D):
		move_and_slide(Vector2.RIGHT*vel)


func _on_Pit_fallen():
	 queue_free()
