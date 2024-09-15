extends State
class_name PlayerDash

@export var button: Button
@export var dashingtimer: Timer
@export var cooldowntimer: Timer
@export var player: CharacterBody2D
const xdashspeed = 500
const ydashspeed = 200

func Enter():
	
	print("in enter", cooldowntimer.time_left)
	dashingtimer.start()

func Physics_Update(delta):
	if !cooldowntimer.is_stopped():
		print("in if cooldowntimer is stopped")
		Transitioned.emit(self, "PlayerMove")
	else:
		if !dashingtimer.is_stopped():
			var xdirection = Input.get_axis("ui_left", "ui_right")
			var ydirection = Input.get_axis("ui_up", "ui_down")
			print(ydirection, "ydir")
			print(xdirection, "xdir")
			xdirection = xdirection if xdirection else 0
			ydirection = ydirection if ydirection else 0
			player.velocity.x = xdirection * xdashspeed
			player.velocity.y = ydirection * ydashspeed
			print(player.velocity.x, "player.velocty.x", player.velocity.y, "player.velocity.y")
		else:
			cooldowntimer.start()
			Transitioned.emit(self, "PlayerMove")
