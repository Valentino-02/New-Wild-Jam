extends Node2D

var radius = 470.0  

onready var _sun = $Sun
onready var _moon = $Moon

func _ready():
	_sun.position = Vector2(1, -1).normalized() * radius
	_moon.position = Vector2(-1, 1).normalized() * radius
	$AnimationPlayer.play("rotation")
