extends Control
class_name MainMenu

func _on_button_pressed() -> void:
	get_parent().spawn_tutorial()
	self.queue_free()
