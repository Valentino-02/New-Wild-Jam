extends Node2D
 
var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

var is_placing := false
var object_to_place
var object_in_mouse
var _map_position : Vector2

onready var parent = get_parent()


func _init():
	game_manager.mouse = self

func placing_down(object) -> void:
	is_placing = true
	object_to_place = object
	object_in_mouse = object_to_place.instance()
	self.add_child(object_in_mouse)

func stop_placing() -> void:
	is_placing = false
	game_manager.is_placing = false
	object_in_mouse.queue_free()

func place_down(object, map_position) -> void:
	if ! board_manager.is_ocupied(map_position) and board_manager.base_grid.is_in_grid(map_position):
		parent.place_down(object, map_position)
		stop_placing()

func _unhandled_input(event: InputEvent) -> void:
	if InputEventMouseMotion:
		position = get_global_mouse_position()
	if event.is_action_pressed("left_click") and ! event.is_echo():
		_map_position = board_manager.base_grid.world_to_map(position)
		if is_placing:
			place_down(object_to_place, _map_position)
	


