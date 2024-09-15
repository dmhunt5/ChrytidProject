extends CharacterBody2D
class_name Player

func _physics_process(_delta):
	move_and_slide()
	
	if velocity.x == 0:
		$AnimatedSprite2D.play("base")
	elif velocity.x != 0:
		$AnimatedSprite2D.play("idle")
	
