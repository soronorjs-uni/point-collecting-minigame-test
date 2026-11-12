extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.powerup_dash.connect(vignette_dash)


func vignette_dash():
	var modulateColor = Color(0.739, 0.614, 0.0, 1.0)
	$".".modulate = modulateColor
	
	$"../AnimationPlayer".play("vignette")
