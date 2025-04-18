extends Node2D
class_name DocumentTemplate

var selected : bool = false

func _physics_process(delta: float) -> void:
	if selected:
		var move_tween = create_tween()
		move_tween.tween_property(self, "global_position", get_global_mouse_position(), 0.3)
		if Input.is_action_just_released("left_click"):
			selected = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_click"):
		selected = true
