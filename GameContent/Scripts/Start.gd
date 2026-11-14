extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed() && self.visible:
		get_tree().paused = false
		GameController.game_start.emit()
		self.visible = false
