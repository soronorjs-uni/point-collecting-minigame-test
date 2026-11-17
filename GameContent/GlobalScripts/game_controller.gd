extends Node

signal score_changed(score: int, required_score: int)

signal game_over()
signal game_start()

signal vignette_effect(color: Color)

var current_score: int:
	set(value):
		current_score = value
		score_changed.emit(value, required_score)
		if value >= required_score:
			game_over.emit()
		
var required_score: int
