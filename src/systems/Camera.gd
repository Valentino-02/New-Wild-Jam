extends Camera2D

enum locations {top_left, top_right}
var location = locations.top_left

onready var anim_player = $AnimationPlayer


func change_position() -> void:
	if location == locations.top_left:
		anim_player.play("move_left")
		location = locations.top_right
	elif location == locations.top_right:
		anim_player.play_backwards("move_left")
		location = locations.top_left
