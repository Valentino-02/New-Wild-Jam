extends BoardObject

func place_down(map_position) -> void:
	.place_down(map_position)
	board_manager.add(self, _map_position + Vector2(0,-1), 1)

