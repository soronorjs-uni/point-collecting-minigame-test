extends Node

signal score_changed(score: int)
signal update_score(score: int, required_score: int)

var current_time: int
var current_score: int:
	set(value):
		current_score = value
		score_changed.emit(value)
