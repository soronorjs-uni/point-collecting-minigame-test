extends Node2D

@export var level_required_score: int = 10
@export var level_time: int = 10

@onready var timer: Timer = %Player.get_node("HUD/MarginContainer/Time/Timer")

func _ready():
	GameController.game_start.connect(start_timer)
	GameController.required_score = level_required_score
	GameController.score_changed.emit(0, GameController.required_score)
	GameController.spawn_delay = 1.0
	SceneManager.set_scene_path(self.get_parent())
	SceneManager.current_scene = $"."
	GameController.set_game_paused(true)

func start_timer():
	timer.start(level_time)
