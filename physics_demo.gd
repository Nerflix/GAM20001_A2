extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

var spawn_position = Vector2(300, 200)

@onready var label = $"../Label"

func _ready():
	position = spawn_position

func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Horizontal movement
	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	# Respawn if fallen off screen
	if position.y > 700:
		position = spawn_position
		velocity = Vector2.ZERO

	# Update label
	label.text = "Position: " + str(position) + "\nOn Floor: " + str(is_on_floor())

	move_and_slide()
