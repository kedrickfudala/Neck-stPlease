extends Node2D
class_name InterrogationRoom

@onready var suspect_num = 0
@onready var current_suspect

@onready var suspects = {
	"suspect1" : preload("res://assets/suspects/suspect1/suspect_1.tscn")
}

func _ready() -> void:
	spawn_suspect("suspect1")

func spawn_suspect(suspect_name : String):
	var suspect_inst = suspects.get(suspect_name).instantiate()
	suspect_inst.global_position = Vector2(-300,120)
	add_child(suspect_inst)
	current_suspect = suspect_inst

func garlic_pressed():
	if current_suspect:
		current_suspect.ask_garlic()

func green_button_pressed():
	if !current_suspect.is_vampire:
		#you were right
		pass
	else:
		game_over()

func stake_pressed():
	if current_suspect.is_vampire:
		#you were right
		pass
	else:
		game_over()

func game_over():
	get_parent().spawn_game_over_menu()
