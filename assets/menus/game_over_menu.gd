extends CanvasLayer
class_name GameOverMenu

func _on_button_pressed() -> void:
	get_parent().spawn_room()
	get_tree().paused = false
	self.queue_free()
