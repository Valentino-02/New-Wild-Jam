extends Control

onready var camera = get_parent().get_parent().get_node("Camera")

func _on_Button_pressed():
	camera.change_position_x()

func _on_Button2_pressed():
	camera.change_position_y()
