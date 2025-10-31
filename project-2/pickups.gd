extends Area2D
@export var color_restore_duration: float = 0.5

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		ColorFX.set_bw(false, color_restore_duration)
		queue_free()
