extends Node2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
var plant_manager = load("res://src/systems/managers/Plant_Manager.tres")
var time_manager = load("res://src/systems/managers/Time_Manager.tres")
var plant_scene = load("res://src/objects/plant/Plant.tscn")

export (NodePath) onready var debug_lbl = get_node(debug_lbl) as Label

func _ready() -> void:
	var plant = plant_scene.instance()
	plant.type = "flower"
	plant.position = Vector2(32, 32)
	add_child(plant)

func _process(delta: float) -> void:
	time_manager.process(delta)
	debug_lbl.text = time_manager.get_time_str(time_manager.time)
