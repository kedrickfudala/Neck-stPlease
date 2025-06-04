extends TextureButton
class_name CrossTool

@onready var uses : int = 2
@onready var hovered : bool = false

func _physics_process(_delta: float) -> void:
	$Label.text = str("Holy Cross")
	$Label.text += str("\nUses: ") + str(uses)
	$Label.visible = hovered

func _on_pressed() -> void:
	get_parent().cross_pressed()
	uses -= 1
	if uses <= 0:
		self.queue_free()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
