extends BoardObject

var plant_manager = preload("res://src/systems/managers/Plant_Manager.tres")
var time_manager = preload("res://src/systems/managers/Time_Manager.tres")

onready var sprite = $Sprite
var type: String 
var last_growth: int
var type_data: Dictionary
var cur_state: int = 0
var next_growth: int

func place_down(map_position) -> void:
	.place_down(map_position)
	last_growth = time_manager.time
	type_data = plant_manager.plant_data[type]
	time_manager.connect("time_changed", self, "time_changed")
	_update_state()

func _ready() -> void:
	last_growth = time_manager.time
	type_data = plant_manager.plant_data[type]
	time_manager.connect("time_changed", self, "time_changed")
	_update_state()

func _update_state() -> void:
	sprite.texture = load(type_data.textures[cur_state])
	
	if type_data.growth_time.size() == cur_state:
		time_manager.disconnect("time_changed", self, "time_changed")
	else:
		next_growth = time_manager.add_times(last_growth, type_data.growth_time[cur_state])
		last_growth = time_manager.time

func time_changed(_past_time, new_time) -> void:
	if new_time >= next_growth:
		cur_state += 1
		_update_state()
