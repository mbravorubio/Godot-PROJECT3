extends Node2D
@export var level_number = 3

@onready var we: WorldEnvironment = $WorldEnvironment

func _ready() -> void:
	if we and we.environment:
		we.environment.adjustment_enabled = true
		we.environment.adjustment_saturation = 0.0  # start fully grayscale
