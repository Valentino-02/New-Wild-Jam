extends Node2D
 
var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var object_data = preload("res://src/objects/Object_Data.tres")

var _is_placing := false
var _object_to_place
var _map_position : Vector2

onready var level = get_parent()

func _init():
	game_manager.mouse = self

func _input(event: InputEvent) -> void:
	if InputEventMouseMotion:
		position = get_global_mouse_position()
	
	if event.is_action_pressed("left_click") and ! event.is_echo():
		if _is_placing:
			_map_position = board_manager.base_grid.world_to_map(position)
			place_down(_map_position)
	
	if event.is_action_pressed("right_click") and ! event.is_echo():
		if _is_placing:
			stop_placing()

func placing_down() -> void:
	if _is_placing == false:
		_is_placing = true
		_object_to_place = load(game_manager.current_object_path).instance()
		self.add_child(_object_to_place)
	if _is_placing == true:
		_object_to_place.queue_free()
		_object_to_place = load(game_manager.current_object_path).instance()
		self.add_child(_object_to_place)

func stop_placing() -> void:
	_is_placing = false
	_object_to_place.queue_free()

func place_down(map_position) -> void:
	if _is_free(map_position) and _is_in_correct_place(map_position):
		level.place_down(map_position)
		game_manager.pay_up()

func _is_free(map_position) -> bool:
	var extra_tile = game_manager.get_extra_tile()
	if ! board_manager.is_ocupied(map_position) and ! board_manager.is_ocupied(map_position+extra_tile):
		return true
	else: 
		return false

func _is_in_correct_place(map_position):
	var extra_tile = game_manager.get_extra_tile()
	match object_data.objects[game_manager.current_object].place:
		"basic":
			return board_manager.base_grid.is_in_grid(map_position) and board_manager.base_grid.is_in_grid(map_position + extra_tile)
		"dirt":
			return board_manager.dirt_grid.is_in_grid(map_position) and board_manager.dirt_grid.is_in_grid(map_position + extra_tile)
		"water":
			return board_manager.water_grid.is_in_grid(map_position) and board_manager.water_grid.is_in_grid(map_position + extra_tile)


