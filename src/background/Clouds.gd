extends Node2D

onready var anim_player = $AnimationPlayer
onready var anim_player2 = $AnimationPlayer2
onready var anim_player3 = $AnimationPlayer3
export var delay : int

func _ready():
	yield(get_tree().create_timer(delay), "timeout")
	_play_first()

func _play_first():
	anim_player.play("move_first")

func _play_second():
	anim_player2.play("move_second")

func _play_third():
	anim_player3.play("move_third")

