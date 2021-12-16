extends Control

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")

onready var build_list = $VBoxContainer/BuildList
onready var info_panel = $VBoxContainer/InfoPanel
onready var build_button = $VBoxContainer/PanelContainer/HBoxContainer/BuildButton
onready var water_button = $VBoxContainer/PanelContainer/HBoxContainer/WaterButton
onready var harvest_button = $VBoxContainer/PanelContainer/HBoxContainer/HarvestButton

func _on_BuildButton_toggled(_button_pressed: bool) -> void:
	if build_button.pressed:
		water_button.pressed = false
		harvest_button.pressed = false
		game_manager.state = "build"
	
	build_list.visible = build_button.pressed
	_fix_state()

func _on_WaterButton_toggled(_button_pressed: bool) -> void:
	if water_button.pressed:
		build_button.pressed = false
		harvest_button.pressed = false
		game_manager.state = "water"
	_fix_state()

func _on_HarvestButton_toggled(_button_pressed: bool) -> void:
	if harvest_button.pressed:
		build_button.pressed = false
		water_button.pressed = false
		game_manager.state = "harvest"
	
	info_panel.visible = harvest_button.pressed
	_fix_state()

func _fix_state() -> void:
	if not build_button.pressed and not water_button.pressed and not harvest_button.pressed:
		game_manager.state = "idle"
