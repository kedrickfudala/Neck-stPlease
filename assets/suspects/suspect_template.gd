extends Node2D
class_name SuspectTemplate

@export var is_vampire : bool
@export var garlic_response : String
@export var cross_response : String
@export var allow_response : String
@onready var allowed : bool = false
@onready var exit : bool = false

@export var documents : Array[PackedScene] = []

func _ready():
	$Label.text = str("")
	spawn_documents()

func _physics_process(delta: float) -> void:
	if global_position.x < 120:
		global_position.x += 2
	if exit:
		if global_position.x < 800:
			global_position.x += 2
		else:
			pass
			#self.queue_free()

func ask_garlic(): #overload this
	$Label.text = garlic_response
	$Timer.start()

func ask_cross():
	$Label.text = cross_response
	$Timer.start()

func allow_passage():
	$Label.text = allow_response
	allowed = true
	$Timer.start()

func spawn_documents():
	for d in documents:
		var d_inst = d.instantiate()
		d_inst.position = Vector2(0,0)
		add_child(d_inst)

func _on_timer_timeout() -> void:
	$Label.text = str("")
	if allowed:
		exit = true
		get_parent().next_suspect()
		for child in get_children():
			child.queue_free()
