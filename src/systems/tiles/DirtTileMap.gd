extends TileMap

var board_manager = preload("res://src/systems/managers/Board_Manager.tres")

func _ready():
	board_manager.dirt_grid = self

func is_in_grid(map_position: Vector2) -> bool:
	return get_cell(int(map_position.x), int(map_position.y)) != INVALID_CELL
