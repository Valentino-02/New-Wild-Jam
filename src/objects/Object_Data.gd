extends Resource

var objects : Dictionary = {
	"apple": {
		"path": "res://src/objects/plant/Plant.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Apple.png",
		"place" : "basic",
		"growth_time": [ 512, 1024 ],
		"growth_textures": [
			"res://assets/sprites/plants/apple_tree_1.png",
			"res://assets/sprites/plants/apple_tree_2.png",
			"res://assets/sprites/plants/apple_tree_3_no_fruit.png"
		],
		"v_offset": -30
	},
	"tomato": {
		"path": "res://src/objects/plant/Plant.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Tomatoe.png",
		"place" : "dirt",
		"growth_time": [ 512, 1024 ],
		"growth_textures": [
			"res://assets/sprites/plants/tomato_plant_1.png",
			"res://assets/sprites/plants/tomato_plant_2.png",
			"res://assets/sprites/plants/tomato_plant_3_no_fruit.png"
		],
		"v_offset": -12
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]
