extends TextureButton
class_name GreenButton

@onready var hovered : bool = false

func _physics_process(_delta: float) -> void:
	$Label.text = str("Allow passage")
	$Label.visible = hovered

func _on_pressed() -> void:
	$GreenButton_sound.play()
	get_parent().green_button_pressed()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
