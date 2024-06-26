extends BoardObject

var object_data = preload("res://src/objects/Object_Data.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var time_manager = preload("res://src/systems/managers/Time_Manager.tres")

export (Texture) var water_icon
export (Texture) var harvest_icon

onready var sprite: Sprite = $PlantSprite
onready var alert_sprite: Sprite = $AlertSprite
onready var alert_tween: Tween = $AlertTween
var tween_positions := [ Vector2(0, -10), Vector2(0, -14) ]
onready var click_area: Area2D = $Area2D
var type: String 
var type_data: Dictionary

var last_growth: int
var next_growth: int

var cur_state: int = 0
var fully_grown: bool = false

var next_water: int
var water_interval: int = time_manager.date_to_int(0, 3, 0)
var needs_water := false
var growth_remainder: int

func place_down(map_position) -> void:
	.place_down(map_position)
	last_growth = time_manager.time
	next_water = time_manager.add_times(time_manager.time, water_interval)
	type_data = object_data.objects[type]
	click_area.input_pickable = true
	time_manager.connect("time_changed", self, "time_changed")
	_update_state()

func _ready() -> void:
	type = game_manager.current_object
	var plant_textures = object_data.objects[type]["growth_textures"]
	sprite.texture = load(plant_textures[plant_textures.size() - 1])
	sprite.offset.y = object_data.objects[type]["v_offset"]
	
	_start_tween()

func _update_state() -> void:
	sprite.texture = load(type_data.growth_textures[cur_state])
	
	if type_data.growth_time.size() == cur_state:
		fully_grown = true
		time_manager.disconnect("time_changed", self, "time_changed")
		alert_sprite.visible = true
		alert_sprite.texture = harvest_icon
	else:
		var growth_time: Array = type_data.growth_time[cur_state]
		var growth_time_int: int = time_manager.date_to_int(growth_time[0], growth_time[1], growth_time[2])
		last_growth = time_manager.time
		next_growth = time_manager.add_times(last_growth, growth_time_int)

func time_changed(_past_time, new_time) -> void:
	if needs_water:
		return
		
	if new_time >= next_growth:
		cur_state += 1
		_update_state()
	
	if not fully_grown and new_time >= next_water:
		needs_water = true
		growth_remainder = time_manager.sub_times(next_growth, new_time)
		alert_sprite.visible = true
		alert_sprite.texture = water_icon

func water() -> void:
	next_growth = time_manager.add_times(time_manager.time, growth_remainder)
	needs_water = false
	next_water = time_manager.add_times(time_manager.time, water_interval)
	alert_sprite.visible = false

func harvest() -> void:
	fully_grown = false
	game_manager.add_money(type_data.harvest_value)
	next_water = time_manager.add_times(time_manager.time, water_interval)
	cur_state -= 1
	
	var growth_time: Array = type_data.growth_time[cur_state]
	var growth_time_int: int = time_manager.date_to_int(growth_time[0], growth_time[1], growth_time[2])
	last_growth = time_manager.time
	next_growth = time_manager.add_times(last_growth, growth_time_int)
	
	_update_state()
	alert_sprite.visible = false

func _on_Area2D_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if needs_water and game_manager.state == "water":
			water()
		
		if fully_grown and game_manager.state == "harvest":
			harvest()

func _start_tween() -> void:
	alert_tween.interpolate_property(alert_sprite, "position", tween_positions[0], tween_positions[1], 1.0, alert_tween.TRANS_SINE, alert_tween.EASE_OUT)
	alert_tween.start()

func _on_AlertTween_tween_completed(_object: Object, _key: NodePath) -> void:
	tween_positions.invert()
	_start_tween()
