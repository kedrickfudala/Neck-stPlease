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

@export_multiline var teeth_response : String
@export_multiline var stain_response : String

@export var documents : Array[PackedScene] = []

@export var entrance_expr : Texture
@export var idle_expr : Texture
@export var garlic_expr : Texture
@export var cross_expr : Texture
@export var name_expr : Texture
@export var birth_expr : Texture
@export var allow_expr : Texture
@export var staked_expr : Texture

@export var teeth_expr : Texture
@export var stain_expr : Texture

@onready var allowed : bool = false
@onready var staked : bool = false
@onready var flee : bool = false

func _ready():
	$Sprite2D.modulate = Color(0,0,0)
	$Label.text = str("")
	$Sprite2D.texture = entrance_expr
	var move_tween = create_tween()
	move_tween.tween_property(self, "global_position", Vector2(140, global_position.y), 1.5)
	await move_tween.finished
	var fade_tween = create_tween()
	fade_tween.tween_property($Sprite2D, "modulate", Color(1,1,1), 0.8)
	await fade_tween.finished
	$Timer.start()
	$Label.text = entrance_text
	spawn_documents()

func ask_garlic():
	$Label.text = garlic_response
	$Sprite2D.texture = garlic_expr
	$Timer.start()

func ask_cross():
	$Label.text = cross_response
	$Sprite2D.texture = cross_expr
	$Timer.start()

func ask_name():
	$Label.text = name_response
	$Sprite2D.texture = name_expr
	$Timer.start()

func ask_birth():
	$Label.text = birth_response
	$Sprite2D.texture = birth_expr
	$Timer.start()
	
func ask_teeth():
	$Label.text = teeth_response
	$Sprite2D.texture = teeth_expr
	$Timer.start()

func ask_stain():
	$Label.text = stain_response
	$Sprite2D.texture = stain_expr
	$Timer.start()

func allow():
	$Label.text = allow_response
	$Sprite2D.texture = allow_expr
	allowed = true
	$Timer.start()

func stake():
	$Label.text = staked_response
	$Sprite2D.texture = staked_expr
	var red_tween = create_tween()
	red_tween.tween_property($Sprite2D, "modulate", Color(1,0,0), $Timer.wait_time)
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
		move_tween.tween_property(self, "global_position", Vector2(600, global_position.y), 1.5)
		await move_tween.finished
		get_parent().next_suspect()
		self.queue_free()
		if is_vampire:
			get_parent().game_over()
	elif staked:
		if !is_vampire:
			get_parent().game_over()
		else:
			for child in $Documents.get_children():
				$Documents.remove_child(child)
			var vanish_tween = create_tween()
			vanish_tween.tween_property($Sprite2D, "modulate", Color(1,0,0,0), 1.5)
			await vanish_tween.finished
			get_parent().next_suspect()
			self.queue_free()
	elif flee:
		for child in $Documents.get_children():
			$Documents.remove_child(child)
	else:
		$Sprite2D.texture = idle_expr
