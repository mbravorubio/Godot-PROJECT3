extends Node2D

func _ready() -> void:
	var overlay := $"FXLayer/GrayscaleOverlay"
	if overlay and overlay.material:
		overlay.material.set_shader_parameter("saturation", 0.0)  
