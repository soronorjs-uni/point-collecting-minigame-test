extends Panel

#func _process(delta: float) -> void:
	#GameController.game_over.connect(display)
#
#func display():
	#$Button.visible = true
	#get_tree().paused = true
#
#func _on_pressed() -> void:
	#get_tree().reload_current_scene()
	#$Button.visible = false
	#GameController.current_score = 0
