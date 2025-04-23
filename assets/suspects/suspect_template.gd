extends Node2D
class_name SuspectTemplate

@export var is_vampire : bool

func _physics_process(delta: float) -> void:
	if global_position.x < 120:
		global_position.x += 2

func ask_garlic(): #overload this
	pass

func ask_cross():
	pass
