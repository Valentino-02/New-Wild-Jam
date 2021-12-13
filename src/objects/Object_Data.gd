extends Resource

var objects : Dictionary = {
	"test_0": {
		"path": "res://src/objects/TestObject.tscn",
		"cost": 30
	},
	"test_1": {
		"path": "res://src/objects/TestObject2.tscn",
		"cost": 40
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]
