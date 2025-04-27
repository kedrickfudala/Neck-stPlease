extends TextureButton
class_name GarlicTool

@onready var uses : int = 2
@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("garlic")
	$Label.text += str("\nUses: ") + str(uses)
	$Label.visible = hovered
	if uses > 0:
		modulate = Color(1,1,1)
	else:
		modulate = Color(1,0,0)

func _on_pressed() -> void:
	if uses > 0: 
		get_parent().garlic_pressed()
		uses -= 1

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
