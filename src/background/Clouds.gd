extends Node2D

onready var anim_player = $AnimationPlayer

func _ready():
	_play_first()

func _play_first():
	anim_player.play("move_first")

func _play_second():
	anim_player.play("move_second")
