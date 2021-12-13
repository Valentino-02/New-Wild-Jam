extends Control

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var object_data = preload("res://src/objects/Object_Data.tres")


func _on_PlaceDown_pressed():
	if $Objects.visible == false:
		$Objects.visible = true
	elif $Objects.visible == true:
		$Objects.visible = false


# This is just for now, then we will have the complete functioning menu
func _on_Object1_pressed():
	game_manager.current_object = "test_0"
	game_manager.start_placing()

func _on_Object2_pressed():
	game_manager.current_object = "test_1"
	game_manager.start_placing()
