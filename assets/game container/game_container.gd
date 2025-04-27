extends Node2D
class_name GameContainer

@onready var main_menu_scene = preload("res://assets/menus/main_menu.tscn")
@onready var tutorial_scene = preload("res://assets/menus/tutorial_menu.tscn")
@onready var room_scene = preload("res://assets/interior/interrogation_room.tscn")
@onready var game_over_menu_scene = preload("res://assets/menus/game_over_menu.tscn")

func _ready():
	$ColorRect.modulate = Color(1,1,1,1)
	spawn_main_menu()
	var blackout_tween = create_tween()
	blackout_tween.tween_property($ColorRect, "modulate", Color(1,1,1,0), 5)
	
func spawn_main_menu():
	var main_menu_inst = main_menu_scene.instantiate()
	main_menu_inst.global_position = Vector2(0,0)
	add_child(main_menu_inst)

func spawn_tutorial():
	var tutorial_inst = tutorial_scene.instantiate()
	tutorial_inst.global_position = Vector2(0,0)
	add_child(tutorial_inst)

func spawn_room():
	var room_inst = room_scene.instantiate()
	room_inst.global_position = Vector2(0,0)
	add_child(room_inst)

func spawn_game_over_menu():
	get_tree().paused = true
	var game_over_menu_inst = game_over_menu_scene.instantiate()
	add_child(game_over_menu_inst)
