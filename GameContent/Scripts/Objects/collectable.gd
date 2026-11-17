extends RigidBody2D

@export var spawnChance : float

@export var pointAmount : int
@export var powerupType : Enum.POWERUP
@export var vignetteColor : Color
@export var camShakeStrength : float

@onready var trail = $Trail

var gave_score = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if !gave_score:
			gave_score = true
			GameController.current_score += pointAmount
			GameController.vignette_effect.emit(vignetteColor)
			GameController.cam_shake.emit(camShakeStrength, 0.1)
		body.powerup(powerupType)
		$".".queue_free()
		
func _process(delta: float) -> void:
	if trail:
		trail.display_trail()
