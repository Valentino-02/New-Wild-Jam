extends Control

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")


func _on_PlaceDown_pressed():
	if $Objects.visible == false:
		$Objects.visible = true
	elif $Objects.visible == true:
		$Objects.visible = false

func _on_Object1_pressed():
	game_manager.start_placing(0)

func _on_Object2_pressed():
	game_manager.start_placing(1)
