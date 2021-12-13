extends Control

onready var build_list = $VBoxContainer/BuildList
onready var build_button = $VBoxContainer/PanelContainer/HBoxContainer/BuildButton
onready var water_button = $VBoxContainer/PanelContainer/HBoxContainer/WaterButton

func _on_WaterButton_toggled(button_pressed: bool) -> void:
	if water_button.pressed:
		build_button.pressed = false

func _on_BuildButton_toggled(button_pressed: bool) -> void:
	if build_button.pressed:
		water_button.pressed = false
	
	build_list.visible = build_button.pressed
