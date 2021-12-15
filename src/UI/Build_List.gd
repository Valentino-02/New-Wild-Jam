extends PanelContainer

var object_data = preload("res://src/objects/Object_Data.tres")
export (PackedScene) var build_button_scene
onready var button_container = $BuildItems

func _ready() -> void:
	for name in object_data.objects:
		var btn_inst = build_button_scene.instance() as TextureButton
		btn_inst.object_name = name
		
		button_container.add_child(btn_inst)
