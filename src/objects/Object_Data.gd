extends Resource

var objects : Dictionary = {
	"test_0": {
		"path": "res://src/objects/TestObject.tscn",
		"cost": 30,
		"decoration": 50,
		"icon_texture": "res://assets/sprites/objects/Character.png"
	},
	"flower": {
		"path": "res://src/objects/plant/Plant.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/objects/Character.png",
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ] ],
		"growth_textures": [
			"res://assets/sprites/plants/flower_seedling.png",
			"res://assets/sprites/plants/flower_growing.png",
			"res://assets/sprites/plants/flower_grown.png"
		],
		"v_offset": -12
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]
