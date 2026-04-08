extends Node2D

@onready var button = $Button
@onready var label = $Label

func _ready():
	button.pressed.connect(_on_spawn_pressed)

func _on_spawn_pressed():
	# Method 1: Using engine coroutine/timer
	spawn_with_coroutine()
	# Method 2: Using float countdown variable
	spawn_with_countdown()

func spawn_with_coroutine():
	var box1 = ColorRect.new()
	box1.color = Color.GREEN
	box1.size = Vector2(50, 50)
	box1.position = Vector2(300, 300)
	add_child(box1)
	label.text = "Green box: deletes in 3 seconds (coroutine)"
	# Wait 3 seconds then delete
	await get_tree().create_timer(3.0).timeout
	box1.queue_free()
	label.text = "Green box deleted by coroutine!"

func spawn_with_countdown():
	var box2 = CountdownBox.new()
	add_child(box2)

class CountdownBox extends ColorRect:
	var countdown = 5.0
	
	func _ready():
		color = Color.ORANGE
		size = Vector2(50, 50)
		position = Vector2(400, 300)
	
	func _process(delta):
		countdown -= delta
		if countdown <= 0:
			queue_free()
