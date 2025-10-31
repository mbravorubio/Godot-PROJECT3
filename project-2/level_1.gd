extends Node2D
@export var level_number = 1
func _on_body_entered(body: Node2D) -> void:
	# Only let the player go through if they collected the pickup
	if body.is_in_group("player") and body.has_pickup:
		get_tree().change_scene_to_file("res://level_2.tscn")
