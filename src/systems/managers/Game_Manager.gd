extends Resource

var object_data = preload("res://src/objects/Object_Data.tres")
var mouse : Node
var money_display : Node
var buttons : Array
var current_object : String
var current_object_path : String
var location : String = "top_right"
var money : int = 100 setget set_money
var decoration : int

func start_placing() -> void:
		current_object_path = object_data.get_path_by_name(current_object)
		mouse.placing_down()

func pay_up() -> void:
	self.money -= object_data.get_cost_by_name(current_object)

func can_pay() -> bool:
	return object_data.get_cost_by_name(current_object) <= money

func get_extra_tile() -> Vector2:
	if object_data.objects[current_object].has("ocupies"):
		return object_data.objects[current_object].ocupies
	else:
		 return Vector2.ZERO

func set_money(value) -> void:
	money = value
	money = clamp(money, 0, 999)
	money_display.update_money(money)
	for button in buttons:
		button.update_can_buy(money)

