extends Label

func _ready() -> void:
	GameController.update_score.connect(display_score)

func display_score(score: int, required_score: int):
	$".".text = "Score: " + str(score) + "/" + str(required_score)
