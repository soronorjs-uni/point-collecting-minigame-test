extends Node2D

@export var required_score: int = 10
@export var level_time: int = 10

func _ready():
	GameController.score_changed.connect(update_score)
	GameController.update_score.emit(0, required_score)

func update_score(score: int):
	GameController.update_score.emit(score, required_score)
	
