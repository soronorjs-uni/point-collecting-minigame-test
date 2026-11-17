extends Node

@onready var spawnTimer = $SpawnTimer

var collectiblePool : PackedStringArray
@export var collectiblePath : String = "res://GameContent/Scenes/Objects/Collectables/"
	
var rng = RandomNumberGenerator.new()
	
func spawn_collectible():
	collectiblePool = DirAccess.get_files_at(collectiblePath)
	var collectiblePoolWeights : PackedFloat32Array
	
	for file : String in collectiblePool:
		var packed_file : PackedScene = load(collectiblePath + "/" + file)
		var scene_state : SceneState = packed_file.get_state()
		collectiblePoolWeights.append(get_spawn_chance(scene_state))
	
	var randomCollectiblePath: String = collectiblePath + "/" + collectiblePool[rng.rand_weighted(collectiblePoolWeights)]
	var randomCollectibleScene : PackedScene = load(randomCollectiblePath)
	var randomCollectible: Node = randomCollectibleScene.instantiate()
	randomCollectible.position = Vector2i(randi_range(100, get_viewport().get_visible_rect().size.x - 100), -600)
	$".".get_parent().add_child(randomCollectible)
	
	spawnTimer.start(GameController.spawn_delay)

func get_spawn_chance(_scene_state : SceneState):
	for index in _scene_state.get_node_property_count(0):
		if _scene_state.get_node_property_name(0, index) == "spawnChance":
			var property_value : float = _scene_state.get_node_property_value(0, index)
			return property_value
