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

func _on_music_body_2d_area_entered(area):
	$MusicPlayer.play()

func _on_music_body_2d_area_exited(area, delta):
	if delta >= 4:
		$MusicPlayer.pause()
	else:
		$MusicPlayer.volume_db - 1
