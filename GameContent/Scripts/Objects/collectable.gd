extends RigidBody2D

@export var pointAmount : int
@export var powerupType : Enum.POWERUP
@export var vignetteColor : Color

var gave_score = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if !gave_score:
			gave_score = true
			GameController.current_score += pointAmount
			GameController.vignette_effect.emit(vignetteColor)
		body.powerup(powerupType)
		$".".queue_free()
