extends Resource

var objects : Dictionary = {
	"apple": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Apple Tree",
		"cost": 15,
		"harvest_value": 100,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Apple.png",
		"place" : "basic",
		"v_offset": -34,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/apple_tree_1.png",
			"res://assets/sprites/plants/apple_tree_2.png",
			"res://assets/sprites/plants/apple_tree_3.png"
			"res://assets/sprites/plants/apple_tree_3_no_fruit.png",
			"res://assets/sprites/plants/apple_tree_3_with_fruit.png"
		]
	},
	"tomato": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Tomatoes",
		"cost": 10,
		"harvest_value": 100,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Tomatoe.png",
		"place" : "dirt",
		"v_offset": -12,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/tomato_plant_1.png",
			"res://assets/sprites/plants/tomato_plant_2.png",
			"res://assets/sprites/plants/tomato_plant_3.png",
			"res://assets/sprites/plants/tomato_plant_3_no_fruit.png",
			"res://assets/sprites/plants/tomato_plant_3_with_fruit.png"
		]
	},
	"berry": {
		"path": "res://src/objects/plant/Plant.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Berry.png",
		"place" : "dirt",
		"growth_time": [ 512, 1024 ],
		"growth_textures": [
			"res://assets/sprites/plants/blackberries_1.png",
			"res://assets/sprites/plants/blackberries_2.png",
			"res://assets/sprites/plants/blackberries_3.png"
		],
		"v_offset": -12
	},
	"watermelon": {
		"path": "res://src/objects/plant/Plant.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/WaterMelon.png",
		"place" : "dirt",
		"growth_time": [ 512, 1024 ],
		"growth_textures": [
			"res://assets/sprites/plants/watermelon_1.png",
			"res://assets/sprites/plants/watermelon_2.png",
			"res://assets/sprites/plants/watermelon_3.png"
		],
		"v_offset": -20
	},
	"bench": {
		"path": "res://src/objects/decorations/Bench.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Bench.png",
		"place" : "basic",
		"ocupies" : Vector2(0,-1)
	},
	"dog_house": {
		"path": "res://src/objects/decorations/Dog_House.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Bone.png",
		"place" : "basic",
		"ocupies" : Vector2(0,-1)
	},
	"lamp": {
		"path": "res://src/objects/decorations/Lamp.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "basic"
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]

