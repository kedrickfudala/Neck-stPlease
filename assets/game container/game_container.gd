extends Node2D
class_name GameContainer

@onready var main_menu_scene = preload("res://assets/menus/main_menu.tscn")
@onready var tutorial_scene = preload("res://assets/menus/tutorial_menu.tscn")
@onready var room_scene = preload("res://assets/interior/interrogation_room.tscn")
@onready var game_over_menu_scene = preload("res://assets/menus/game_over_menu.tscn")
@onready var victory_screen_scene = preload("res://assets/menus/victory_screen.tscn")

@onready var robert_alive : bool = true

func _ready():
	init()

func init():
	$ColorRect.size = Vector2(1152, 648)
	$ColorRect.modulate = Color(1,1,1,1)
	$AudioStreamPlayer2D.play()
	spawn_main_menu()
	var blackout_tween = create_tween()
	blackout_tween.tween_property($ColorRect, "modulate", Color(1,1,1,0), 5)
	await blackout_tween.finished
	$ColorRect.queue_free()

func spawn_main_menu():
	if !$AudioStreamPlayer2D.is_playing:
		$AudioStreamPlayer2D.play()
	var main_menu_inst = main_menu_scene.instantiate()
	main_menu_inst.global_position = Vector2(0,0)
	add_child(main_menu_inst)

func spawn_tutorial():
	var tutorial_inst = tutorial_scene.instantiate()
	tutorial_inst.global_position = Vector2(0,0)
	add_child(tutorial_inst)

func spawn_room():
	if !$AudioStreamPlayer2D.is_playing:
		$AudioStreamPlayer2D.play()
	var room_inst = room_scene.instantiate()
	room_inst.global_position = Vector2(0,0)
	add_child(room_inst)

func spawn_game_over_menu():
	$AudioStreamPlayer2D.stop()
	get_tree().paused = true
	var game_over_menu_inst = game_over_menu_scene.instantiate()
	add_child(game_over_menu_inst)

func spawn_victory_screen():
	$AudioStreamPlayer2D.stop()
	var victory_screen_inst = victory_screen_scene.instantiate()
	if !robert_alive:
		victory_screen_inst.robert_died()
	add_child(victory_screen_inst)
