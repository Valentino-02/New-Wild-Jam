extends Node2D

func place_down(object, map_position) -> void:
	var current_object = object.instance()
	add_child(current_object)
	current_object.place_down(map_position)

