extends TextureButton

var object_data = preload("res://src/objects/Object_Data.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var object_name: String

func _ready() -> void:
	var my_data = object_data.objects[object_name]
	texture_normal = load(my_data.icon_texture)

func _on_BuildButton_pressed() -> void:
	game_manager.current_object = object_name
	game_manager.start_placing()
