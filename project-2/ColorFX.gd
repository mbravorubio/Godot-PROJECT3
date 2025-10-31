extends Node

var env: Environment

func _ready() -> void:
	_refresh_env()

func _refresh_env() -> void:
	var we := get_tree().current_scene.get_node_or_null("WorldEnvironment")
	if we and we is WorldEnvironment:
		env = we.environment
		if env:
			env.adjustment_enabled = true

func set_bw(enabled: bool, duration: float = 0.35) -> void:
	if not env:
		_refresh_env()
	if not env:
		return
	var target := 0.0 if enabled else 1.0
	var tween := get_tree().create_tween()
	tween.tween_property(env, "adjustment_saturation", target, duration)
