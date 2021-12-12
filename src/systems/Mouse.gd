extends Node2D
 
var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

var is_placing := false
var object_to_place
var _map_position : Vector2

onready var parent = get_parent()


func _init():
	game_manager.mouse = self

func placing_down(object) -> void:
	is_placing = true
	object_to_place = object
	self.add_child(object_to_place.instance())

func stop_placing() -> void:
	pass

func place_down(object, map_position) -> void:
	parent.place_down(object, map_position)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_click") and ! event.is_echo():
		_map_position = board_manager.base_grid.world_to_map(position)
		if is_placing:
			place_down(object_to_place, _map_position)



	if InputEventMouseMotion:
		position = get_global_mouse_position()

