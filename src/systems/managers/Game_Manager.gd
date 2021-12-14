extends Resource

var object_data = preload("res://src/objects/Object_Data.tres")
var mouse : Node
var money_display : Node

var current_object : String
var current_object_path : String
var is_placing := false
var money : int = 100 setget set_money
var decoration : int

func start_placing() -> void:
	if is_placing == false:
		is_placing = true
		current_object_path = object_data.get_path_by_name(current_object)
		mouse.placing_down()

func pay_up() -> void:
	self.money -= object_data.get_cost_by_name(current_object)

func can_pay() -> bool:
	return object_data.get_cost_by_name(current_object) <= money

func set_money(value) -> void:
	money = value
	money = clamp(money, 0, 999)
	money_display.update_money(money)
	
