extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

var spawn_position = Vector2(300, 200)
var was_on_floor = false

@onready var audio = $"../AudioStreamPlayer"
@onready var label = $"../Label"

func _ready():
	position = spawn_position

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	if position.y > 700:
		position = spawn_position
		velocity = Vector2.ZERO

	# Detect landing collision
	if is_on_floor() and !was_on_floor:
		audio.play()
		spawn_impact()

	was_on_floor = is_on_floor()
	label.text = "Position: " + str(position)
	move_and_slide()

func spawn_impact():
	var impact = ColorRect.new()
	impact.color = Color.YELLOW
	impact.size = Vector2(20, 20)
	impact.position = position
	get_parent().add_child(impact)
	# Delete impact after 0.5 seconds
	await get_tree().create_timer(0.5).timeout
	impact.queue_free()
