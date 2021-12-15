extends Node2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
var time_manager = load("res://src/systems/managers/Time_Manager.tres")
var time = 0.0
onready var board_obj_container = $BoardObjectSort as Node2D

func place_down(map_position) -> void:
	var current_object = load(game_manager.current_object_path).instance()
	board_obj_container.add_child(current_object)
	current_object.place_down(map_position)

func _process(delta: float) -> void:
	time_manager.process(delta)
	time += delta
	var day_time = int(time) % time_manager.day_duration
	if day_time > time_manager.day_duration:
		modulate = Color(move_toward(1, 0.4, 0.01), move_toward(1, 0.4, 0.01), move_toward(1, 0.5, 0.01))


func _input(event):
	if event.is_action_pressed("space"):
		modulate = Color(0.4, 0.4, 0.5)
