extends Node

signal score_changed(score: int, required_score: int)

signal game_over()
signal game_start()

signal vignette_effect(color: Color)

signal cam_shake(intensity: int, time: float)

var current_score: int:
	set(value):
		if value >= 0:
			current_score = value
			score_changed.emit(value, required_score)
			if value >= required_score:
				game_over.emit()
		
var required_score: int

var inf_dash : bool = false

func set_game_paused(paused: bool):
	get_tree().paused = paused
	Engine.time_scale = !paused
