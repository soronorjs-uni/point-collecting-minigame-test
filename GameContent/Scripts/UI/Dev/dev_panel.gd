extends Node
		

func _unhandled_key_input(event: InputEvent) -> void:
	if OS.is_debug_build():
		if Input.is_key_pressed(KEY_F1):
			self.visible = !self.visible
	else:
		self.visible = false
