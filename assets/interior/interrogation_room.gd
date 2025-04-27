extends Node2D
class_name InterrogationRoom

@onready var suspect_num = 0
@onready var current_suspect

@onready var mag_glass : bool = false

@onready var suspects = [preload("res://assets/suspects/suspect1/suspect_1.tscn"), preload("res://assets/suspects/suspect2/suspect_2.tscn")]

func _ready() -> void:
	next_suspect()

func next_suspect():
	if suspect_num < len(suspects):
		spawn_suspect(suspect_num)
		suspect_num += 1

func spawn_suspect(index : int):
	var suspect_inst = suspects[index].instantiate()
	suspect_inst.global_position = Vector2(-200,275)
	add_child(suspect_inst)
	current_suspect = suspect_inst

func garlic_pressed():
	if current_suspect:
		current_suspect.ask_garlic()

func cross_pressed():
	if current_suspect:
		current_suspect.ask_cross()

func green_button_pressed():
	if current_suspect and !current_suspect.is_vampire:
		current_suspect.allow()
	else:
		game_over()

func stake_pressed():
	if current_suspect and current_suspect.is_vampire:
		current_suspect.stake()
	else:
		game_over()

func game_over():
	get_parent().spawn_game_over_menu()
