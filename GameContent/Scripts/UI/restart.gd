extends Panel

func _ready() -> void:
	GameController.game_over.connect(display)

func display():
	$Button.visible = true
	GameController.set_game_paused(true)

func _on_pressed() -> void:
	GameController.reset()
