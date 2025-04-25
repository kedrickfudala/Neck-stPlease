extends Node2D
class_name DocumentTemplate

var selected : bool = false

@onready var suspect = get_parent().get_parent()

func _physics_process(delta: float) -> void:
	if selected && !suspect.get_parent().mag_glass:
		var move_tween = create_tween()
		move_tween.tween_property(self, "global_position", get_global_mouse_position(), 0.3).set_ease(Tween.EASE_IN)
		if Input.is_action_just_released("left_click"):
			selected = false
			move_tween.stop()
	if global_position.x < 0 or global_position.x > 900 or global_position.y < 0 or global_position.y > 600:
		global_position = Vector2(450,300)

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		selected = true
