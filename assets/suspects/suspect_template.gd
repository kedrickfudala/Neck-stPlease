extends Node2D
class_name SuspectTemplate

@export var is_vampire : bool
@export var entrance_text : String
@export var garlic_response : String
@export var cross_response : String
@export var allow_response : String
@export var name_response : String
@export var birth_response : String
@onready var allowed : bool = false

@export var documents : Array[PackedScene] = []

func _ready():
	$Label.text = str("")
	#spawn_documents()
	var move_tween = create_tween()
	move_tween.tween_property(self, "global_position", Vector2(120, 120), 1.5)
	await move_tween.finished
	$Label.text = entrance_text
	$Timer.start()
	spawn_documents()

func ask_garlic(): #overload this
	$Label.text = garlic_response
	$Timer.start()

func ask_cross():
	$Label.text = cross_response
	$Timer.start()

func ask_name():
	$Label.text = name_response
	$Timer.start()

func ask_birth():
	$Label.text = birth_response
	$Timer.start()

func allow_passage():
	$Label.text = allow_response
	allowed = true
	$Timer.start()

func spawn_documents():
	for d in documents:
		var d_inst = d.instantiate()
		d_inst.position = Vector2(0,350)
		$Documents.add_child(d_inst)

func _on_timer_timeout() -> void:
	$Label.text = str("")
	if allowed:
		for child in $Documents.get_children():
			$Documents.remove_child(child)
		var move_tween = create_tween()
		move_tween.tween_property(self, "global_position", Vector2(600, 120), 1.5)
		await move_tween.finished
		get_parent().next_suspect()
		self.queue_free()
