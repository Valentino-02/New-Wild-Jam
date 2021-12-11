extends Resource


var object : PackedScene 

var mouse : Node
var is_placing := false

func toggle_is_placing() -> void:
	if is_placing == false:
		is_placing = true
		mouse.stop_placing()
	elif is_placing == true:
		is_placing = false
		mouse.placing_down(object)
