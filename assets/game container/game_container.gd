extends Node2D
class_name GameContainer

@onready var main_menu_scene = preload("res://assets/menus/main_menu.tscn")
@onready var room_scene = preload("res://assets/interior/interrogation_room.tscn")

func _ready():
	spawn_main_menu()
	
func spawn_main_menu():
	var main_menu_inst = main_menu_scene.instantiate()
	add_child(main_menu_inst)
	"""print("here")
	if Input.is_action_just_pressed("ui_accept"):
		print("here")
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/dialogue.dialogue"),"START")
		return"""

func spawn_room():
	var room_inst = room_scene.instantiate()
	room_inst.global_position = Vector2(0,0)
	add_child(room_inst)
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/dialogue.dialogue"),"START")
