extends Node2D

var radius = 200  

onready var _sun = $Sun
onready var _moon = $Moon

func _ready():
	_sun.position = Vector2(0, -radius)
	_moon.position = Vector2(0, radius)
	$AnimationPlayer.play("rotation")
