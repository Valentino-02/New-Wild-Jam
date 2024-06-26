extends Node2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
var time_manager = load("res://src/systems/managers/Time_Manager.tres")
var time = 0.0
onready var board_obj_container_tr = get_node("TR").get_node("BoardObjectSort") 
onready var board_obj_container_tl = get_node("TL").get_node("BoardObjectSort") 
onready var board_obj_container_br = get_node("BR").get_node("BoardObjectSort") 
onready var board_obj_container_bl = get_node("BL").get_node("BoardObjectSort") 

func _ready():
	$Day_n_Night.play("DayNight")

func place_down(map_position) -> void:
	var current_object = load(game_manager.current_object_path).instance()
	match game_manager.location:
		"top_right":
			board_obj_container_tr.add_child(current_object)
		"top_left":
			board_obj_container_tl.add_child(current_object)
		"bottom_right":
			board_obj_container_br.add_child(current_object)
		"bottom_left":
			board_obj_container_bl.add_child(current_object)
	current_object.place_down(map_position)

func _process(delta: float) -> void:
	time_manager.process(delta)


