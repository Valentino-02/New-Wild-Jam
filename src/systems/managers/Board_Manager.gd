extends Resource

const _DIRECTIONS = [Vector2.LEFT, Vector2.RIGHT, Vector2.UP, Vector2.DOWN]

var base_grid : TileMap
var water_grid : TileMap
var dirt_grid : TileMap
var node_to_map : Dictionary = {}
var traversible_node_to_map : Dictionary = {}


func add(node_to_add: Node, map_position: Vector2, dictionary : int) -> void:
	if dictionary == 1:
		if ! node_to_map.has(map_position):
			node_to_map[map_position] = node_to_add
	elif dictionary == 0:
		if ! traversible_node_to_map.has(map_position):
			traversible_node_to_map[map_position] = node_to_add

func remove(map_position: Vector2, dictionary : int) -> void:
	if dictionary == 1:
		if node_to_map.has(map_position):
			node_to_map.erase(map_position)
	elif dictionary == 0:
		if traversible_node_to_map.has(map_position):
			traversible_node_to_map.erase(map_position)

func is_ocupied(map_position: Vector2) -> bool:
	return node_to_map.has(map_position)

func update_position(node: Node, new_position: Vector2) -> void:
	if ! is_ocupied(new_position):
		remove(node._map_position, 1)
		add(node, new_position, 1)

func get_cell_node(map_position: Vector2, dictionary : int) -> Node:
	if dictionary == 1:
		if node_to_map.has(map_position):
			return node_to_map[map_position]
		else:
			return null
	elif dictionary == 0:
		if traversible_node_to_map.has(map_position):
			return traversible_node_to_map[map_position]
		else:
			return null
	else:
		return null

func get_free_cells_by_steps(starting_cell: Vector2, steps: int) -> Array:
	var cells := [starting_cell]
	var testing_cells := [starting_cell]
	var new_testing_cells := []
	for i in range(steps):
		while ! testing_cells.empty():
			var testing_cell = testing_cells.pop_back()
			for direction in _DIRECTIONS:
				var new_cell: Vector2 = testing_cell + direction
				if is_ocupied(new_cell): 
					continue
				if new_cell in cells:
					continue
				if ! base_grid.is_in_grid(new_cell):
					continue
				cells.append(new_cell)
				new_testing_cells.append(new_cell)
		testing_cells.append_array(new_testing_cells)
	return cells

func get_free_cells_between(starting_cell: Vector2, max_distance: int) -> Array:
	var cells := []
	var testing_cells := [starting_cell]
	while ! testing_cells.empty():
		var current_cell = testing_cells.pop_back()
		var distance := starting_cell.distance_to(current_cell)
		if distance > max_distance:
			continue
		if ! base_grid.is_in_grid(current_cell):
			continue
		if current_cell in cells:
			continue
		cells.append(current_cell)
		for direction in _DIRECTIONS:
			var new_cell: Vector2 = current_cell + direction
			if is_ocupied(new_cell): 
				continue
			if new_cell in cells:
				continue
			testing_cells.append(new_cell)
	return cells

func get_cells_between(starting_cell: Vector2, max_distance: int) -> Array:
	var cells := []
	var testing_cells := [starting_cell]
	while ! testing_cells.empty():
		var current_cell = testing_cells.pop_back()
		var distance := starting_cell.distance_to(current_cell)
		if distance > max_distance:
			continue
		if ! base_grid.is_in_grid(current_cell):
			continue
		if current_cell in cells:
			continue
		cells.append(current_cell)
		for direction in _DIRECTIONS:
			var new_cell: Vector2 = current_cell + direction
			if new_cell in cells:
				continue
			testing_cells.append(new_cell)
	return cells

func get_cells_between_with_minimum(starting_cell: Vector2, min_distance : int, max_distance: int) -> Array:
	var cells := []
	var cells_with_minimum := []
	var testing_cells := [starting_cell]
	while ! testing_cells.empty():
		var current_cell = testing_cells.pop_back()
		var distance := starting_cell.distance_to(current_cell)
		if ! base_grid.is_in_grid(current_cell):
			continue
		if current_cell in cells:
			continue
		if distance > max_distance:
			continue
		cells.append(current_cell)
		if distance > min_distance:
			cells_with_minimum.append(current_cell)
		for direction in _DIRECTIONS:
			var new_cell: Vector2 = current_cell + direction
			if new_cell in cells:
				continue
			testing_cells.append(new_cell)
	return cells_with_minimum

func get_cell_closer_to (objective: Vector2, cells: Array) -> Vector2:
	var closest_cell : Vector2
	var longest_distance = 1000
	for cell in cells:
		var distance = cell.distance_to(objective)
		if distance < longest_distance:
			longest_distance = distance
			closest_cell = cell
	return closest_cell

func get_cells_in_line(starting_cell: Vector2, steps: int, direction: Vector2) -> Array:
	var cells := [starting_cell]
	var testing_cells := [starting_cell]
	var new_testing_cells := []
	for i in range(steps):
		while ! testing_cells.empty():
			var testing_cell : Vector2 = testing_cells.pop_back()
			var new_cell: Vector2 = testing_cell + direction
			if ! base_grid.is_in_grid(new_cell):
				continue
			cells.append(new_cell)
			new_testing_cells.append(new_cell)
		testing_cells.append_array(new_testing_cells)
	return cells
