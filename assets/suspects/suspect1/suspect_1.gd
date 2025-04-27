extends SuspectTemplate
class_name Suspect1

func _physics_process(delta: float) -> void:
	if get_parent().mag_glass:
		$TextureButton/ColorRect.visible = true
		$TextureButton.mouse_filter = 0
	else:
		$TextureButton/ColorRect.visible = false
		$TextureButton.mouse_filter = 2

func _on_texture_button_pressed() -> void:
	if get_parent().mag_glass:
		get_parent().mag_glass = false
