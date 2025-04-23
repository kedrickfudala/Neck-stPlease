extends TextureButton
class_name MagGlassTool

@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("mag glass\ninvestigate discrepencies")
	$Label.visible = hovered
	if get_parent().mag_glass:
		modulate = Color(0,1,0)
	else:
		modulate = Color(1,1,1)

func _on_pressed() -> void:
	if get_parent().mag_glass:
		get_parent().mag_glass = false
	else:
		get_parent().mag_glass = true

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
