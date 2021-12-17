extends Camera2D

var game_manager = load("res://src/systems/managers/Game_Manager.tres")
enum locations {top_left, top_right, bottom_left, bottom_right}
var location = locations.top_right setget set_location
onready var anim_player = $AnimationPlayer

func change_position_x() -> void:
	if location == locations.top_right:
		anim_player.play("move_left")
		location = locations.top_left
	elif location == locations.top_left:
		anim_player.play_backwards("move_left")
		location = locations.top_right
	elif location == locations.bottom_right:
		anim_player.play("move_down_left")
		location = locations.bottom_left
	elif location == locations.bottom_left:
		anim_player.play_backwards("move_down_left")
		location = locations.bottom_right

func change_position_y() -> void:
	if location == locations.top_right:
		anim_player.play("move_down")
		self.location = locations.bottom_right
	elif location == locations.bottom_right:
		anim_player.play_backwards("move_down")
		self.location = locations.top_right
	elif location == locations.top_left:
		anim_player.play("move_left_down")
		self.location = locations.bottom_left
	elif location == locations.bottom_left:
		anim_player.play_backwards("move_left_down")
		self.location = locations.top_left

func set_location(value) -> void:
	location = value
	match location:
		locations.top_right:
			game_manager.location = "top_right"
		locations.top_left:
			game_manager.location = "top_left"
		locations.bottom_right:
			game_manager.location = "bottom_right"
		locations.bottom_left:
			game_manager.location = "bottom_left"
