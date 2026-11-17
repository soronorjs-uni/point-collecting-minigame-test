extends Node

@export var scene_holder: Node
@export var current_scene: Node

signal scene_changed(scene: Node)

func _ready():
	if scene_holder:
		GameController.reset()
		load_scene("res://GameContent/Scenes/game.tscn")

func load_scene(scene_path: String):
	if scene_holder:
		instance_scene(load(scene_path))
	
func set_scene_path(node: Node):
	scene_holder = node
			
func instance_scene(packed_scene : PackedScene):
	if current_scene:
		scene_holder.remove_child(current_scene)
		current_scene.queue_free()
			
	var new_scene = packed_scene.instantiate()
	scene_holder.add_child(new_scene)
		
	current_scene = scene_holder.get_child(-1)
	scene_changed.emit(new_scene)
