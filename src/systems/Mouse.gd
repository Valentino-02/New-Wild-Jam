extends Node2D
 
var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

var is_placing := false

func _init():
	game_manager.mouse = self

func placing_down(object : PackedScene) -> void:
	self.add_child(object.instance)

func stop_placing() -> void:
	pass

func place_down() -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and ! event.is_echo():
		pass

	if InputEventMouseMotion and is_placing:
		var _mouse_map_position = board_manager.base_grid.world_to_map(get_global_mouse_position())

