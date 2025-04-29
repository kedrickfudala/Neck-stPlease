extends CanvasLayer

@onready var robert_died_texture = preload("res://assets/menus/killed_edward_game_end.PNG")

func _on_button_pressed() -> void:
	get_parent().spawn_main_menu_scene()
	self.queue_free()

func robert_died():
	$Sprite.texture = robert_died_texture
