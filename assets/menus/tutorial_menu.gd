extends CanvasLayer

func _on_button_pressed() -> void:
	get_parent().spawn_room()
	self.queue_free()
