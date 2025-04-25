extends DocumentTemplate

func _on_name_button_pressed() -> void:
	if get_parent().get_parent().get_parent().mag_glass:
		suspect.ask_name()
		get_parent().get_parent().get_parent().mag_glass = false

func _on_texture_button_pressed() -> void:
	if get_parent().get_parent().get_parent().mag_glass:
		suspect.ask_birth()
		get_parent().get_parent().get_parent().mag_glass = false
