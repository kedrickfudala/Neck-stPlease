extends TextureButton
class_name GarlicTool

@onready var uses : int = 2
@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("garlic")
	$Label.text += str("\nUses: ") + str(uses)
	$Label.visible = hovered
	if uses > 1:
		$Sprite2D2.visible = true
	else:
		$Sprite2D2.visible = false

func _on_pressed() -> void:
	get_parent().garlic_pressed()
	uses -= 1
	if uses <= 0:
		self.queue_free()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
