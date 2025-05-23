extends DocumentTemplate

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	if suspect.get_parent().mag_glass:
		$NameButton/ColorRect.visible = true
		$BirthButton/ColorRect.visible = true
		$NameButton.mouse_filter = 0
		$BirthButton.mouse_filter = 0
	else:
		$NameButton/ColorRect.visible = false
		$BirthButton/ColorRect.visible = false
		$NameButton.mouse_filter = 2
		$BirthButton.mouse_filter = 2

func _on_name_button_pressed() -> void:
	if suspect.get_parent().mag_glass:
		suspect.ask_name()
		suspect.get_parent().mag_glass = false

func _on_birth_button_pressed() -> void:
	if suspect.get_parent().mag_glass:
		suspect.ask_birth()
		suspect.get_parent().mag_glass = false
