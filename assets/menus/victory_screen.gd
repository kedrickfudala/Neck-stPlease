extends CanvasLayer

func _on_button_pressed() -> void:
	get_parent().spawn_main_menu()
	get_parent().play_music()
	self.queue_free()

func robert_died():
	$Sprite2D2.visible = true
