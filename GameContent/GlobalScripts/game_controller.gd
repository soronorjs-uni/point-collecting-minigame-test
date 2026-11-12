extends Node

signal score_changed(score: int)
signal update_score(score: int, required_score: int)

signal game_over()
signal game_start()

var current_score: int:
	set(value):
		current_score = value
		score_changed.emit(value)
