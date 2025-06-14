extends TextureButton
class_name GarlicTool

@onready var uses : int = 3
@onready var hovered : bool = false

func _physics_process(_delta: float) -> void:
	$Label.text = str("Garlic")
	$Label.text += str("\nUses: ") + str(uses)
	$Label.visible = hovered
	match(uses):
		3:
			$Sprite2D.visible = true
			$Sprite2D2.visible = true
			$Sprite2D3.visible = true
		2:
			$Sprite2D.visible = true
			$Sprite2D2.visible = true
			$Sprite2D3.visible = false
		1:
			$Sprite2D.visible = true
			$Sprite2D2.visible = false
			$Sprite2D3.visible = false
		0:
			$Sprite2D.visible = false
			$Sprite2D2.visible = false
			$Sprite2D3.visible = false

func _on_pressed() -> void:
	get_parent().garlic_pressed()
	uses -= 1
	if uses <= 0:
		self.queue_free()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
