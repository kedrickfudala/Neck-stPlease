extends TextureButton
class_name Stake

@onready var hovered : bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str("stake person\nin heart")
	$Label.visible = hovered

func _on_pressed() -> void:
	$AudioStreamPlayer2D.play()
	get_parent().stake_pressed()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
