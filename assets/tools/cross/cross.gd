extends TextureButton

@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("holy cross")
	$Label.text += str("\nUses: 1 ")
	$Label.visible = hovered

func _on_pressed() -> void:
	get_parent().cross_pressed()
	self.queue_free()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
