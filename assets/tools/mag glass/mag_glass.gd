extends TextureButton

@onready var hovered : bool = false
@onready var selected : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("mag glass\ninvestigate discrepencies")
	$Label.visible = hovered
	if selected:
		modulate = Color(0,1,0)
	else:
		modulate = Color(1,1,1)

func _on_pressed() -> void:
	if selected:
		selected = false
	else:
		selected = true

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
