extends Node2D

var current_object

func place_down(object, map_position) -> void:
	current_object = object.instance()
	add_child(current_object)
	current_object.place_down(map_position)

