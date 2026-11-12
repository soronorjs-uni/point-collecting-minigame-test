extends Node2D

@export var required_score: int = 10
@export var level_time: int = 10

@onready var timer: Timer = %Player.get_node("HUD/Layout/Time/Timer")

func _ready():
	GameController.game_start.connect(start_timer)
	GameController.score_changed.connect(update_score)
	GameController.update_score.emit(0, required_score)
	get_tree().paused = true

func update_score(score: int):
	GameController.update_score.emit(score, required_score)

func start_timer():
	timer.start(level_time)
