extends Resource


var object 

var mouse : Node
var is_placing := false

func toggle_is_placing() -> void:
	if is_placing == false:
		is_placing = true
		object = load("res://src/objects/TestObject.tscn")
		mouse.placing_down(object)


