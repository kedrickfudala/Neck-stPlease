extends SuspectTemplate
class_name Suspect5

func stake():
	is_vampire = true
	get_parent().get_parent().robert_alive = false
	super.stake()

func _physics_process(_delta: float) -> void:
	if get_parent().mag_glass:
		$TextureButton/ColorRect.visible = true
		$TextureButton.mouse_filter = 0
	else:
		$TextureButton/ColorRect.visible = false
		$TextureButton.mouse_filter = 2

func _on_texture_button_pressed() -> void:
	if get_parent().mag_glass:
		ask_teeth()
		get_parent().mag_glass = false
