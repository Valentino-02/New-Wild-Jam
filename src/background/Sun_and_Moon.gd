extends Node2D

var speed = 0.25  
var radius = 200  

onready var _sun = $Sun
onready var _moon = $Moon

func _ready():
	_sun.position = Vector2(-radius, 0)
	_moon.position = Vector2(radius, 0)

func _process(delta):
	rotation += speed * delta
	_sun.rotation -= speed * delta
	_moon.rotation -= speed * delta

