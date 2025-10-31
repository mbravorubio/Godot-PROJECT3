extends Node

var overlay: ColorRect

func _ready() -> void:
	_refresh_overlay()
	# Start in black & white on load
	if overlay and overlay.material is ShaderMaterial:
		(overlay.material as ShaderMaterial).set_shader_parameter("saturation", 0.0)

func _refresh_overlay() -> void:
	var scene := get_tree().current_scene
	if scene == null:
		overlay = null
		return
   
	overlay = scene.get_node_or_null("FXLayer/GrayscaleOverlay")
	if overlay == null:
		overlay = scene.get_node_or_null("GrayscaleOverlay")
  
	if overlay == null:
		overlay = scene.find_child("GrayscaleOverlay", true, false) as ColorRect

func set_bw(enabled: bool, duration: float = 0.35) -> void:
	_refresh_overlay()
	if not (overlay and overlay.material is ShaderMaterial):
		return

	var sh := overlay.material as ShaderMaterial
	var from: float = float(sh.get_shader_parameter("saturation"))
	var target: float = 0.0 if enabled else 1.0     

	var tw := get_tree().create_tween()
	tw.tween_method(
		func(v: float) -> void:
			sh.set_shader_parameter("saturation", v),
		from, target, duration
	)
