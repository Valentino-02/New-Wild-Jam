extends Resource

var objects_by_id : Dictionary = {
	0 : "res://src/objects/TestObject.tscn" , 
	1 : "res://src/objects/TestObject2.tscn" 
	}

var object 

var mouse : Node
var is_placing := false

func start_placing(id) -> void:
	if is_placing == false:
		is_placing = true
		object = load(get_path_by_id(id))
		mouse.placing_down(object)

func get_path_by_id (id: int) -> String:
	return objects_by_id[id]

