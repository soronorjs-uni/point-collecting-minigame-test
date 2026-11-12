extends Node

@onready var spawnTimer = $SpawnTimer
	
func spawn_collectible():
	var randomCollectibleRes = FileUtility.load_random_file_from_directory("res://GameContent/Scenes/Objects/Collectables/")
	var randomCollectible = randomCollectibleRes.instantiate()
	randomCollectible.position = Vector2i(randi_range(100, get_viewport().get_visible_rect().size.x - 100), -600)
	$".".get_parent().add_child(randomCollectible)
	
	spawnTimer.start(randi_range(1, 2))
