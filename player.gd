extends CharacterBody2D

const SPEED = 200.0

@onready var label = $"../Label"

func _physics_process(delta):
	# Get analog axis input using Input Map
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")
	
	# Normalize for consistent speed diagonally
	if input_vector.length() > 0:
		input_vector = input_vector.normalized()
	
	# Apply speed
	velocity = input_vector * SPEED
	
	# Check button inputs
	var is_jumping = Input.is_action_pressed("jump")
	var is_sprinting = Input.is_action_pressed("sprint")
	
	# Update label to show input debug info
	label.text = "Movement: " + str(input_vector) + "\nJump: " + str(is_jumping) + "\nSprint: " + str(is_sprinting)
	
	# Move the character
	move_and_slide()
