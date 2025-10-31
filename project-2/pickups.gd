extends Area2D
signal collected  

func _on_body_entered(body: Node2D) -> void:
	# Only the player can collect this
	if body.name == "Player": 
		emit_signal("collected")
	if body.is_in_group("player"):
		body.has_pickup = true  
		queue_free()            # make the pickup disappear
