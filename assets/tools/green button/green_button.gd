extends TextureButton
class_name GreenButton

@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("allow passage")
	$Label.visible = hovered

func _on_pressed() -> void:
	get_parent().green_button_pressed()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
