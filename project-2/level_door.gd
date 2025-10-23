extends Area2D
func _ready() -> void:
	$UI/menu.visible=false
	

	

func _on_body_entered(body: Node2D) -> void:
	if body.name=="player":
		get_tree().paused=true
		$UI/Menu.visible=true
		$AnimationPlayer.play("ui_visibility")
	pass # Replace with function body.


func _on_restart_button_pressed() -> void:
	get_tree().paused=false
	$UI/Menu.visible=false
	
	pass # Replace with function body.


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	$UI/Menu.visible=false 
	pass # Replace with function body.
@export var next_level: PackedScene
