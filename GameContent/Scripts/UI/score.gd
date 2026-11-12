extends Label

func display_score(score: int, required_score: int):
	$".".text = "Score: " + str(score) + "/" + str(required_score)
