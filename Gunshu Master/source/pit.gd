extends Area2D

var inside 

signal fallen

func _ready():
	inside = false

func _physics_process(delta):
	if not Input.is_action_pressed("Jump") and inside:
		emit_signal("fallen")

func _on_Pit_body_entered(body):
	inside = true
	
func _on_Pit_body_exited(body):
	inside = false
