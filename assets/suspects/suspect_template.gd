extends Node2D
class_name SuspectTemplate

@export var is_vampire : bool
@export_multiline var entrance_text : String
@export_multiline var garlic_response : String
@export_multiline var cross_response : String
@export_multiline var allow_response : String
@export_multiline var staked_response : String
@export_multiline var name_response : String
@export_multiline var birth_response : String

@onready var allowed : bool = false
@onready var staked : bool = false

@export var documents : Array[PackedScene] = []

func _ready():
	$Sprite2D.modulate = Color(0,0,0)
	$Label.text = str("")
	#spawn_documents()
	var move_tween = create_tween()
	move_tween.tween_property(self, "global_position", Vector2(130, global_position.y), 1.5)
	await move_tween.finished
	var fade_tween = create_tween()
	fade_tween.tween_property($Sprite2D, "modulate", Color(1,1,1), 0.8)
	await fade_tween.finished
	$Timer.start()
	$Label.text = entrance_text
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

func allow_reponse():
	$Label.text = allow_response
	allowed = true
	$Timer.start()

func staked_reponse():
	$Label.text = staked_response
	staked = true
	$Timer.start()

func spawn_documents():
	for d in documents:
		var d_inst = d.instantiate()
		d_inst.position = Vector2(150,400)
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
	if staked:
		pass
