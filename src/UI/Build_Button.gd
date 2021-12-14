extends TextureButton

var object_data = preload("res://src/objects/Object_Data.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var object_name: String
var _my_data
var _can_buy : bool 

func _ready() -> void:
	_my_data = object_data.objects[object_name]
	texture_normal = load(_my_data.icon_texture)
	game_manager.buttons.append(self)
	update_can_buy(game_manager.money)

func _on_BuildButton_pressed() -> void:
	if _can_buy:
		game_manager.current_object = object_name
		game_manager.start_placing()

func update_can_buy(money) -> void:
	if _my_data.cost > money:
		_can_buy = false
		modulate = Color(0.5, 0.5, 0.5)
	elif _my_data.cost <= money:
		_can_buy = true
		modulate = Color(1, 1, 1)

