extends RigidBody2D

@export var pointAmount : int
@export var powerupType : Enum.POWERUP

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		GameController.update_score.emit(pointAmount)
		body.powerup(powerupType)
		$".".queue_free()
