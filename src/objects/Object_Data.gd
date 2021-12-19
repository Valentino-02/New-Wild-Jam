extends Resource

var objects : Dictionary = {
	"apple": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Apple Tree",
		"cost": 50,
		"harvest_value": 350,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Apple.png",
		"place" : "basic",
		"v_offset": -34,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/apple_tree_1.png",
			"res://assets/sprites/plants/apple_tree_2.png",
			"res://assets/sprites/plants/apple_tree_3.png",
			"res://assets/sprites/plants/apple_tree_3_with_fruit.png",
			"res://assets/sprites/plants/apple_tree_3_with_fruit.png"
		]
	},
	"Tomatoes": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Tomatoes",
		"cost": 10,
		"harvest_value": 120,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Tomatoe.png",
		"place" : "dirt",
		"v_offset": -12,
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/tomato_plant_1.png",
			"res://assets/sprites/plants/tomato_plant_2.png",
			"res://assets/sprites/plants/tomato_plant_3.png",
			"res://assets/sprites/plants/tomato_plant_3_with_fruit.png",
			"res://assets/sprites/plants/tomato_plant_3_with_fruit.png"
		]
	},
	"berry": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "Berry",
		"cost": 20,
		"harvest_value": 200,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Berry.png",
		"place" : "dirt",
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0] ],
		"growth_textures": [
			"res://assets/sprites/plants/blackberries_1.png",
			"res://assets/sprites/plants/blackberries_2.png",
			"res://assets/sprites/plants/blackberries_3.png",
			"res://assets/sprites/plants/blackberries_3_with_fruit.png",
			"res://assets/sprites/plants/blackberries_3_with_fruit.png"
		],
		"v_offset": -12
	},
	"watermelon": {
		"path": "res://src/objects/plant/Plant.tscn",
		"display_name": "WaterMelon",
		"harvest_value": 200,
		"cost": 20,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/WaterMelon.png",
		"place" : "dirt",
		"growth_time": [ [ 0, 4, 0 ], [ 0, 4, 0 ], [ 0, 4, 0]  ],
		"growth_textures": [
			"res://assets/sprites/plants/watermelon_1.png",
			"res://assets/sprites/plants/watermelon_2.png",
			"res://assets/sprites/plants/watermelon_3.png",
			"res://assets/sprites/plants/watermelon_3_with_fruit.png",
			"res://assets/sprites/plants/watermelon_3_with_fruit.png"
		],
		"v_offset": -10
	},
	"bench": {
		"path": "res://src/objects/decorations/Bench.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Bench.png",
		"place" : "basic",
		"ocupies" : Vector2(0,-1)
	},
	"dog_house": {
		"path": "res://src/objects/decorations/Dog_House.tscn",
		"cost": 50,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Bone.png",
		"place" : "basic",
		"ocupies" : Vector2(0,-1)
	},
	"lamp": {
		"path": "res://src/objects/decorations/Lamp.tscn",
		"cost": 25,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "basic"
	},
	"evertree": {
		"path": "res://src/objects/decorations/EverGreen.tscn",
		"cost": 70,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "basic"
	},
	"stonepath": {
		"path": "res://src/objects/decorations/StonePath.tscn",
		"cost": 10,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "basic"
	},
	"reeds": {
		"path": "res://src/objects/decorations/Reeds.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "water"
	},
	"waterplant": {
		"path": "res://src/objects/decorations/WaterPlant.tscn",
		"cost": 40,
		"decoration": 60,
		"icon_texture": "res://assets/sprites/UI/Lamp.png",
		"place" : "water"
	}
}

func get_path_by_name(name: String) -> String:
	return objects[name]["path"]

func get_cost_by_name(name: String) -> int:
	return objects[name]["cost"]

