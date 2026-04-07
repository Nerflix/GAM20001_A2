extends Control

@onready var button = $Button
@onready var button2 = $Button2
@onready var button3 = $Button3
@onready var button4 = $Button4
@onready var button5 = $Button5
@onready var button6 = $Button6
@onready var button7 = $Button7
@onready var label = $Label
@onready var color_rect = $ColorRect

var click_count = 0
var spawned_object = null

func _ready():
	button.pressed.connect(_on_button_pressed)
	button2.pressed.connect(_on_hide_show)
	button3.pressed.connect(_on_create)
	button4.pressed.connect(_on_delete)
	button5.pressed.connect(_on_switch_scene)
	button6.pressed.connect(_on_exit)
	button7.pressed.connect(_on_toggle_fullscreen)

func _on_button_pressed():
	click_count += 1
	label.text = "Button clicked " + str(click_count) + " times!"

func _on_hide_show():
	color_rect.visible = !color_rect.visible

func _on_create():
	spawned_object = ColorRect.new()
	spawned_object.color = Color.BLUE
	spawned_object.size = Vector2(80, 80)
	spawned_object.position = Vector2(400, 450)
	add_child(spawned_object)

func _on_delete():
	if spawned_object != null:
		spawned_object.queue_free()
		spawned_object = null

func _on_switch_scene():
	get_tree().change_scene_to_file("res://scene2.tscn")

func _on_exit():
	get_tree().quit()

func _on_toggle_fullscreen():
	var window = get_window()
	if window.mode == Window.MODE_FULLSCREEN:
		window.mode = Window.MODE_WINDOWED
	else:
		window.mode = Window.MODE_FULLSCREEN
