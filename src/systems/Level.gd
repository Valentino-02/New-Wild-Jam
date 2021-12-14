extends Node2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
var time_manager = load("res://src/systems/managers/Time_Manager.tres")

func place_down(object, map_position) -> void:
	var current_object = object.instance()
	add_child(current_object)
	current_object.place_down(map_position)

func _process(delta: float) -> void:
	time_manager.process(delta)
