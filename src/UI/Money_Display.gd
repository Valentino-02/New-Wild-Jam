extends Control

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

func _init():
	game_manager.money_display = self

func _ready():
	$Label.text = "Money = " + str(game_manager.money)

func update_money(ammount: int) -> void:
	$Label.text = "Money = " + str(ammount)
	
