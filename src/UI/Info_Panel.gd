extends PanelContainer

var board_manager = preload("res://src/systems/managers/Board_Manager.tres")
var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var time_manager = preload("res://src/systems/managers/Time_Manager.tres")

onready var type_label = $VBoxContainer/TypeLabel
onready var status_label = $VBoxContainer/StatusLabel

func _process(_delta: float) -> void:
	if game_manager.state != "harvest" and game_manager.state != "water":
		return
	
	var mouse_pos = get_global_mouse_position() - Vector2(250, 80)
	var grid_pos = board_manager.base_grid.world_to_map(mouse_pos)
	var plant = board_manager.get_cell_node(grid_pos, 1)
	
	if plant in get_tree().get_nodes_in_group("plants"):
	
		if plant == null:
			visible = false
			return
		visible = true
		
		type_label.text = plant.type_data.display_name
		if plant.needs_water:
			status_label.text = "Requires water!"
		elif plant.fully_grown:
			status_label.text = "Ready to harvest!"
		else:
			var growth_time = time_manager.get_time_array(time_manager.sub_times(plant.next_growth, time_manager.time))
			status_label.text = "Grows in %sd %sh %sm" % growth_time
