extends Label

var game_manager = preload("res://src/systems/managers/Game_Manager.tres")
var time_manager = preload("res://src/systems/managers/Time_Manager.tres")

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and event.scancode == KEY_F3:
		visible = !visible
	
func _process(_delta: float) -> void:
	text = "fps: %s\n" % Engine.get_frames_per_second()
	text += "state: %s\n" % game_manager.state
	text += "%s\n" % time_manager.get_time_str(time_manager.time)
