extends Label

func _ready() -> void:
	GameController.score_changed.connect(display_score)

func display_score(score: int, required_score: int):
	$".".text = "Score: " + str(score) + "/" + str(required_score)
