extends Control

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_door.tscn")


@onready var player = $Player
@onready var panel = $Panel
@onready var pickups = $Pickups
@onready var hint_label = $CanvasLayer/HintLabel


var stage := 0  # Tutorial progress tracker
var tutorial_complete := false  # Flag to stop updates

func _ready():
	hint_label.text = "Use LEFT and RIGHT to move!"
	panel.modulate = Color(0.6, 0.6, 0.6)  # start gray

	if pickups:
		pickups.connect("collected", Callable(self, "_on_pickup_collected"))
	else:
		push_warning("⚠️ Pickups node not found in scene!")

func _process(delta: float) -> void:
	if tutorial_complete:
		return  

	match stage:
		0:
			if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
				stage = 1
				hint_label.text = "Good! Now press SPACE to jump"

		1:
			if Input.is_action_just_pressed("jump"):
				stage = 2
				hint_label.text = "Nice! Reach the glowing goal to finish"

		2:
			# Waiting for pickup — do nothing until signal
			pass

func _on_pickup_collected():
	panel.modulate = Color(1.0, 0.2, 0.573, 1.0)  # turn panel green
	hint_label.text = "Awesome! Tutorial complete!"
	stage = 3
	tutorial_complete = true  
