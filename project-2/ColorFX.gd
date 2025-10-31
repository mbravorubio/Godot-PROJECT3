extends Node

var overlay: ColorRect
var env: Environment

func _ready() -> void:
	_refresh_env()

func _refresh_env() -> void:
	# Look for the WorldEnvironment and GrayscaleOverlay in the current scene
	var we := get_tree().current_scene.get_node_or_null("WorldEnvironment")
	var ol := get_tree().current_scene.get_node_or_null("GrayscaleOverlay")
	if we and we is WorldEnvironment:
		env = we.environment
		if env:
			env.adjustment_enabled = true
	if ol and ol is ColorRect:
		overlay = ol

func set_bw(enabled: bool, duration: float = 0.35) -> void:
   
	if not overlay or not overlay.material:
		_refresh_env()
	if not overlay or not overlay.material:
		return

	
	var target: float = 0.0 if enabled else 1.0
	var from: float = float(overlay.material.get_shader_parameter("saturation"))


	var tween := get_tree().create_tween()
	tween.tween_method(
		func(v: float) -> void:
			overlay.material.set_shader_parameter("saturation", v),
		from, target, duration
	)
