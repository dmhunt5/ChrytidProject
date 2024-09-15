extends State
class_name PlayerMove

@export var player: CharacterBody2D

const speed = 80.0
const jump_power = -150.0
const wall_jump_pushback = 200

const wall_slide_gravity = 40
var is_wall_sliding = false

var gravity = 10

func Enter():
	pass

func Physics_Update(delta):

	# Player hide.
	if Input.is_action_pressed("hide"):
		player.z_index = 0
	else:
		player.z_index = 1
		
	# Add the gravity.
	if not player.is_on_floor():
		player.velocity.y += gravity;

	# Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
	#	player.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		player.velocity.x = direction * speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, speed)

	player.move_and_slide()
	jump()
	wall_slide()
	
	if Input.is_action_just_pressed("ui_page_down"):
		Transitioned.emit(self, "PlayerDash")
		


func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("ui_left", "ui_right")
	input_dir = input_dir.normalized()
	return input_dir

func jump():
	if Input.is_action_just_pressed("ui_accept"):
		if player.is_on_floor():
			player.velocity.y += jump_power
		elif player.is_on_wall_only():
			player.velocity = Vector2(player.get_wall_normal().x * wall_jump_pushback, jump_power)
		
func wall_slide():
	if player.is_on_wall_only() and Input.get_axis("ui_left", "ui_right"):  
		player.velocity.y = min(player.velocity.y, wall_slide_gravity)
