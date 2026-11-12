extends Node2D

@onready var scene_holder = $"."

var scene

func _ready():
	load_scene("res://GameContent/Scenes/game.tscn")

func load_scene(scene_path: String):
	if scene_holder.get_child_count() > 0:
		for child in scene_holder.get_children():
			scene_holder.remove_child(child)
			child.queue_free()

	if not scene:
		var scene = load(scene_path)
		var scene_instance = scene.instantiate()
		scene_holder.add_child(scene_instance)
