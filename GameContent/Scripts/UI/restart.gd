extends Panel

func _process(delta: float) -> void:
	GameController.game_over.connect(display)

func display():
	$Button.visible = true
	get_tree().paused = true

func _on_pressed() -> void:
	SceneManager.load_scene("res://GameContent/Scenes/game.tscn")
	$Button.visible = false
	GameController.current_score = 0
