extends Label

@export var score: int
@export var required_score: int

func _ready() -> void:
	display_score(0)

func display_score(score: int):
	$".".text = "Score: " + str(score) + "/" + str(required_score)
