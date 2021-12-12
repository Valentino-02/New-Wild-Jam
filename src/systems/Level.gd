extends Node2D

var current_object

func place_down(object, map_position) -> void:
	current_object = object.instance()
	add_child(object.instance())
	current_object.place_down()




