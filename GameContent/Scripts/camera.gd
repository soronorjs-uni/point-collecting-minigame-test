extends Camera2D

@export var shake_strength: float
	
func _physics_process(delta: float) -> void:
	cam_shake()
	shake_strength = move_toward(shake_strength, 0, 1)
	print("Shake: ", shake_strength)
	
func cam_shake():
	offset = Vector2(randf_range(0, 1) * shake_strength, randf_range(0, 0.1 * shake_strength))
