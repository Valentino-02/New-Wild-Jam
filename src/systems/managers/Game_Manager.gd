extends Resource

var object_data = preload("res://src/objects/Object_Data.tres")

var current_object

var mouse : Node
var money_display : Node
var is_placing := false
var money : int = 100 setget set_money

func start_placing() -> void:
	if is_placing == false:
		is_placing = true
		var object = load(object_data.get_path_by_name(current_object))
		mouse.placing_down(object)

func pay_up() -> void:
	self.money -= object_data.get_cost_by_name(current_object)

func set_money(value) -> void:
	money = value
	money = clamp(money, 0, 999)
	money_display.update_money(money)
