extends Node2D
class_name BoardObject

var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

var _map_position : Vector2 

func place_down(map_position) -> void:
	_map_position = map_position
	position = _map_to_world(_map_position)
	board_manager.add(self, _map_position, 1)

func _world_to_map(world_position: Vector2) -> Vector2:
	return board_manager.base_grid.world_to_map(world_position)

func _map_to_world(map_position: Vector2) -> Vector2:
	return (board_manager.base_grid.map_to_world(map_position)) + Vector2(0, board_manager.base_grid.cell_size.y / 2)

func _update_position(new_position: Vector2) -> void:
	if ! board_manager.is_ocupied(new_position) and board_manager.base_grid.is_in_grid(new_position):
		board_manager.update_position(self, new_position)
		_map_position = new_position
		
