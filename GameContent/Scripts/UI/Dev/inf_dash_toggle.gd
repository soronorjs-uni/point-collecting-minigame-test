extends CheckButton

func _on_toggled(toggled_on: bool) -> void:
	GameController.inf_dash = toggled_on
