extends Control

func _physics_process(delta):
	if(Input.is_action_just_pressed("esc")) and visible == true):
		hide()

func _on_resume_pressed():
	pass # Replace with function body.
