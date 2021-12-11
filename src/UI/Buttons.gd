extends Control

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

func _on_Button_pressed():
	game_manager.toggle_is_placing()
