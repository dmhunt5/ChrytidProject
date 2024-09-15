extends Node2D

@onready var ppm = $Player/Camera2D2/CanvasLayer/PPM
var paused = false

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("esc"):
		PPM()
		
func PPM():
	if paused:
		ppm.hide()
		Engine.time_scale = 1
	else:
		ppm.show()
		Engine.time_scale = 0
	
	paused = !paused
