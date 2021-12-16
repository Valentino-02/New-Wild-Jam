extends Resource

var object_data = preload("res://src/objects/Object_Data.tres")
var mouse : Node
var money_display : Node

var state : String = "idle"

var buttons : Array
var current_object : String
var current_object_path : String
var money : int = 100 setget set_money
var decoration : int

const MIN_MONEY: int = 0
const MAX_MONEY: int = 999

func start_placing() -> void:
		current_object_path = object_data.get_path_by_name(current_object)
		mouse.placing_down()

func pay_up() -> void:
	self.money -= object_data.get_cost_by_name(current_object)

func add_money(value: int) -> void:
	set_money(money + value)

func set_money(value) -> void:
	money = value
	money = int(clamp(money, MIN_MONEY, MAX_MONEY))
	money_display.update_money(money)
	for button in buttons:
		button.update_can_buy(money)

