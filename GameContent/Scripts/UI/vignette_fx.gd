extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameController.vignette_effect.connect(vignette_effect)


func vignette_effect(color: Color):
	var modulateColor = color
	$".".modulate = modulateColor
	
	$"../AnimationPlayer".play("vignette")
