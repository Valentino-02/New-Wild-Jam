extends Resource

var objects : Dictionary = {
	"apple": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Apple Tree",
		"cost": 40,
		"harvest_value": 100,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Apple.png",
		"place" : "basic",
		"v_offset": -34,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/apple_tree_1.png",
			"res://assets/sprites/plants/apple_tree_2.png",
			"res://assets/sprites/plants/apple_tree_3_no_fruit.png",
			"res://assets/sprites/plants/apple_tree_3_with_fruit.png"
		]
	},
	"tomato": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Tomatoes",
		"cost": 40,
		"harvest_value": 100,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Tomatoe.png",
		"place" : "dirt",
		"v_offset": -12,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/tomato_plant_1.png",
			"res://assets/sprites/plants/tomato_plant_2.png",
			"res://assets/sprites/plants/tomato_plant_3_no_fruit.png",
			"res://assets/sprites/plants/tomato_plant_3_with_fruit.png"
		]
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]
