extends Node

signal score_changed(score: int)
signal update_score(score: int, required_score: int)

@export var current_score: int:
	set(value):
		score_changed.emit(value)
