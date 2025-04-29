extends Node2D
class_name InterrogationRoom

@onready var suspect_num = 0
@onready var current_suspect

@onready var mag_glass : bool = false

@onready var suspect1 = preload("res://assets/suspects/suspect1/suspect_1.tscn")
@onready var suspect2 = preload("res://assets/suspects/suspect2/suspect_2.tscn")
@onready var suspect3
@onready var suspect4 = preload("res://assets/suspects/suspect4/suspect_4.tscn")
@onready var suspect5 = preload("res://assets/suspects/suspect5/suspect_5.tscn")

@onready var suspects = [suspect1, suspect2, suspect4, suspect5]

func _ready() -> void:
	next_suspect()

func next_suspect():
	if suspect_num < len(suspects):
		spawn_suspect(suspect_num)
		suspect_num += 1
	else:
		get_parent().victory_screen_scene()
		self.queue_free()

func spawn_suspect(index : int):
	var suspect_inst = suspects[index].instantiate()
	suspect_inst.global_position = Vector2(-200,225)
	add_child(suspect_inst)
	current_suspect = suspect_inst

func garlic_pressed():
	if current_suspect:
		current_suspect.ask_garlic()

func cross_pressed():
	if current_suspect:
		current_suspect.ask_cross()

func green_button_pressed():
	if current_suspect:
		current_suspect.allow()

func stake_pressed():
	if current_suspect:
		current_suspect.stake()

func game_over():
	get_parent().spawn_game_over_menu()
	self.queue_free()
