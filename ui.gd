extends Control

# Get references to our Button and Label nodes
@onready var button = $Button
@onready var label = $Label

# click counter variable
var click_count = 0

func _ready():
	# Connect the button's pressed signal to our function
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	# Every time button is clicked, increase counter
	click_count += 1
	# Update the label text
	label.text = "Button clicked " + str(click_count) + " times!"
