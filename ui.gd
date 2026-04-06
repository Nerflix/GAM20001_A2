extends Control

@onready var button = $Button
@onready var label = $Label
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var color_rect = $ColorRect

var click_count = 0
var spawned_object = null

func _ready():
	button.pressed.connect(_on_button_pressed)
	button2.pressed.connect(_on_hide_show)
	button3.pressed.connect(_on_create)
	button4.pressed.connect(_on_delete)

func _on_button_pressed():
	click_count += 1
	label.text = "Button clicked " + str(click_count) + " times!"

func _on_hide_show():
	color_rect.visible = !color_rect.visible

func _on_create():
	spawned_object = ColorRect.new()
	spawned_object.color = Color.BLUE
	spawned_object.size = Vector2(80, 80)
	spawned_object.position = Vector2(400, 350)
	add_child(spawned_object)

func _on_delete():
	if spawned_object != null:
		spawned_object.queue_free()
		spawned_object = null
