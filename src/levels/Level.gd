extends Node2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
var time_manager = load("res://src/systems/managers/Time_Manager.tres")
var time = 0.0
onready var board_obj_container = $BoardObjectSort as Node2D

func _ready():
	$AnimationPlayer.play("DayNight")

func place_down(map_position) -> void:
	var current_object = load(game_manager.current_object_path).instance()
	board_obj_container.add_child(current_object)
	current_object.place_down(map_position)

func _process(delta: float) -> void:
	time_manager.process(delta)


